
from flask import Flask, jsonify, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Following, Rating, Game, System, Genre, UserSystem, GameGenre, GameSystem
from jinja2 import StrictUndefined
from datetime import datetime
import os, math
from igdb_api_python.igdb import igdb
from flask_sqlalchemy import SQLAlchemy
from correlation import pearson
from random import choice

app = Flask(__name__)
# TODO update this to be actually secret
app.secret_key = "SECRETSECRETSECRET"

app.jinja_env.undefined = StrictUndefined

REQUEST_URL = "https://api-2445582011268.apicast.io"

igdb = igdb("a215ea8dd33f4c3e384980920450bf5d")

#*****************************************************************************#

@app.route("/")
def homepage():
    """Show homepage"""

    return render_template("homepage.html")


@app.route("/user/<user_id>")
def user_profile(user_id):
    """Show user profile"""

    user_info = User.query.filter_by(user_id=user_id).first()
    account_created = user_info.account_created
    account_created = str(account_created)[:11]
    system_info = UserSystem.query.filter_by(user_id=user_id).all()
    rating_info = db.session.query(Game.name, Rating.score).join(Rating).filter(Rating.user_id==user_id).all()

    return render_template("user_profile.html", user_info=user_info,
                                                system_info=system_info,
                                                rating_info=rating_info,
                                                account_created=account_created)

@app.route("/recommendation")
def get_recommendation():
    """Show a game the user would probably like"""

    recommendations = []
    games_info = []

    for game in games:
        sims = get_all_similarities(game)
        raw_pred = predict(sims, users, game)

        if raw_pred > 3.0:

            recommendation = (game, raw_pred)
            recommendations.append(recommendation)

    for rec in recommendations:
        one_game_info = Game.query.filter(Game.game_id==rec[0]).first()
        name = one_game_info.name
        percentage = round(rec[1] * 20, 2)
        games_info.append({"name": name, "percentage": percentage})
    print "Printing games info"
    print games_info

    return render_template("recommendation.html", games_info=games_info)

@app.route("/search.json")
def search_for_game():
    """This is me testing out doing the below function in AJAX"""

    game = request.args.get("searchField")
    print "Printing in /search.json, game"
    print game
    game_info = Game.query.filter(Game.name.like("%"+game+"%")).first()
    game_id = games.index(game_info.game_id)
    
    # current_user = session["user_id"]
    # target_user = users[current_user-1]

    # target_game = game_id

    # sims = get_similarities(target_user, target_game)
    # raw_pred = predict(sims, users, target_game)
    # prediction = round(raw_pred, 2)

    # return jsonify(game_info, prediction)
    game_stuff = {"game_id": game_id, "name": game_info.name}

    return jsonify(game_stuff)


# @app.route("/search")
# def search_game():
#     """Handle search, render game details page"""
#     print "Getting game info"
#     game = request.args.get("search")
#     game_info = Game.query.filter(Game.name.like("%"+game+"%")).first()
#     game_id = games.index(game_info.game_id)

#     # print "Getting user info ..."
    
#     # current_user = session["user_id"]
#     # print "Printing users"
#     # print users[current_user]
#     # target_user = users[current_user-1]
#     # target_game = game_id

#     # print "Getting similarities..."
#     # sims = get_similarities(target_user, target_game)
#     # print "Sims size: {}".format(len(sims))
#     # print "Getting predictions..."
#     # raw_pred = predict(sims, users, target_game)
#     # print "Raw prediction is {}".format(raw_pred)
#     # print "Rounding..."
#     # prediction = round(raw_pred, 2)


#     # return render_template("game_details.html", game_info=game_info, 
#     #                        prediction=prediction)

#     return render_template("game_details.html", game_info=game_info)


def filt_all(user1, user2, games):
    """Filter down lists to only include ratings they've both done"""

    result = []

    user1_ratings = [score for game_id, score in sorted(users[user1].items())]
    user2_ratings = [score for game_id, score in sorted(users[user2].items())]

    users_filt = zip(user1_ratings, user2_ratings, games)

    print "This is users from filt():..."
    print users_filt

    for u1, u2, game_id in users_filt:
        if u1 and u2:
            result.append((u1, u2, game_id))

    print "This is the result from filt():..."
    print result

    return result

def filt(user1, user2, games):
    """Filter down lists to only include ratings they've both done"""

    result = []

    users = zip(user1, user2, games)

    print "This is users from filt():..."
    print users

    for u1, u2, game_id in users:
        if u1 and u2:
            result.append((u1, u2, game_id))

    print "This is the result from filt():..."
    print result

    return result

def get_similarities(target_user, target_game):
    """Get the similarity between users based on ratings"""
    # import pdb; pdb.set_trace()

    sims = {}
    for i, user in enumerate(users):
        print "Printing in get_similarities"
        if user != target_user and user[target_game]:
            red_users = filt(user, target_user, games)
            print "This is the red_users"
            print red_users
            if red_users[0]:
                sim = pearson(zip(red_users[0], red_users[1]))
                print "I'm about to print the sim"
                print sim
                sims[i] = sim
    return sims

def get_all_similarities(target_game):
    """Get the similarity between users based on ratings"""
    # import pdb; pdb.set_trace()

    sims = {}
    for user in users.items():
        print "Printing in get_similarities"
        if user[0] != session['user_id'] and user[1][target_game]:
            red_users = filt_all(user[0], session['user_id'], games)
            print "This is the red_users"
            print red_users
            if red_users[0]:
                sim = pearson(zip(red_users[0], red_users[1]))
                print "I'm about to print the sim"
                print sim
                sims[user[0]] = sim
    return sims


def predict(sims, users, target_game):
    """Predict similarity"""

    pos_numerator = sum(sim * users[i][target_game] for i, sim in sims.items() if sim >= 0)
    neg_numerator = sum(-sim * (6 - users[i][target_game]) for i, sim in sims.items() if sim <0)
    denominator = sum(sim for i, sim in sims.items())
    print "Printing denominator from predict()"
    print denominator   
    result = "Need more data to predict!" if denominator == 0 else (pos_numerator + neg_numerator) / denominator
    
    return result


@app.route("/gamerating", methods=["POST"])
def game_rating():
    """Update or add game rating to database"""

    rating = request.form.get("rating")
    game_id = request.form.get("game_id")
    current_user = session["user_id"]

    existing_rating = Rating.query.filter_by(user_id=current_user, game_id=game_id).first()

    if existing_rating is None:
        new_rating = Rating(user_id=current_user, game_id=game_id,score=rating)

        db.session.add(new_rating)
        db.session.commit()

        return redirect(request.referrer)

    else:
        existing_rating.score = rating
        db.session.commit()

        return redirect(request.referrer)


@app.route("/register", methods=["GET"])
def register():
    """Show registration form"""

    platform_list = []

    platforms = System.query.all()

    for platform in platforms:
        platform_list.append(platform.name)

    return render_template("registration.html", platform_list=platform_list)


@app.route("/register", methods=["POST"])
def register_process():
    """Get information from registration form."""

    username = request.form.get("username")
    email = request.form.get("email")
    password = request.form.get("password")
    systems =request.form.getlist("systems")
    account_created = datetime.now()

    existing_username = User.query.filter_by(username=username).first()
    existing_email = User.query.filter_by(email=email).first()

    # check if the username is in use
    if existing_username is None and existing_email is None:
        #check if the email is in use
        new_user = User(username=username, email=email, password=password, 
                        account_created=account_created)

        db.session.add(new_user)
        db.session.commit()

        for system in systems:
            # add each system to the database for the specific user
            system_id = db.session.query(System.system_id).filter(System.name==system).first()
            new_user_system = UserSystem(user_id=new_user.user_id, system_id=system_id)

            db.session.add(new_user_system)
            db.session.commit()

        flash("Successfully registered " + username + "!")
        return redirect("/")

    else:
        flash("Username or email already in use")
        # TODO probably handle this in AJAX on the form and be more specific
        # as to whether it was the username or email that failed
        return redirect("/")

@app.route("/login", methods=["GET"])
def attempt_login():
    """Show login page"""

    return render_template("login.html")


@app.route("/login", methods=["POST"])
def login():
    """Attempt to log the user in"""

    email = request.form.get("email")
    password = request.form.get("password")

    existing_email = User.query.filter_by(email=email).first()

    if existing_email is not None and existing_email.password == password:
            # add user to session
        session["user_id"] = existing_email.user_id

        flash("Successfully logged in!")
        return render_template("homepage.html")

    elif existing_email is None:
        flash("Incorrect email.")
        return redirect('/login')
    else:
        flash("Incorrect password.")
        return redirect('/login')

@app.route("/logout")
def do_logout():
    """Log user out."""

    flash("Goodbye!")
    session["user_id"] = ""

    return redirect("/")


#*****************************************************************************#

if __name__ == "__main__":

    from flask import Flask

    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)
    print "Connected to DB."
    games = [game.game_id for game in db.session.query(Game.game_id).all()]
    # users = [[Rating.query.filter_by(user_id=user.user_id, game_id=game_id
    #           ).first().score if Rating.query.filter_by(user_id=user.user_id, 
    #                                     game_id=game_id).first() else 0 for game_id in games] for user in User.query.all()]

    users = {}

    for user in User.query.all():
        userrating = {}
        for game in games:
            gamerating = Rating.query.filter_by(game_id=game, user_id=user.user_id).first()
            if gamerating:
                userrating[game] = gamerating.score
            else:
                userrating[game] = 0

        users[user.user_id] = userrating    

    app.run(port=5000, host='0.0.0.0')








