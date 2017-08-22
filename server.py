
from flask import Flask, jsonify, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Following, Rating, Game, System, Genre, UserSystem, GameGenre, GameSystem
from jinja2 import StrictUndefined
from datetime import datetime
import os, math
from igdb_api_python.igdb import igdb
from flask_sqlalchemy import SQLAlchemy
from helper_functions import pearson, filt_all
from random import choice

app = Flask(__name__)
# TODO update this to be actually secret
app.secret_key = "SECRETSECRETSECRET"

app.jinja_env.undefined = StrictUndefined

REQUEST_URL = "https://api-2445582011268.apicast.io"

igdb = igdb("a215ea8dd33f4c3e384980920450bf5d")

#*****************************************************************************#
@app.route("/")
def welcome():
    """Show welcome page"""

    return render_template("welcome.html")


@app.route("/homepage")
def homepage():
    """Show homepage"""

    user_id = session["user_id"]
    system_info = UserSystem.query.filter_by(user_id=user_id).all()
    genre_info = Genre.query.all()

    return render_template("homepage.html", system_info=system_info, genre_info=genre_info)


@app.route("/user/<user_id>")
def user_profile(user_id):
    """Show user profile"""

    user_info = User.query.filter_by(user_id=user_id).first()
    account_created = user_info.account_created
    account_created = str(account_created)[:11]
    system_info = UserSystem.query.filter_by(user_id=user_id).all()
    rating_info = db.session.query(Game.name, Rating.score, Game.game_id).join(Rating).filter(Rating.user_id==user_id).all()

    return render_template("user_profile.html", user_info=user_info,
                                                system_info=system_info,
                                                rating_info=rating_info,
                                                account_created=account_created)


@app.route("/recommendation")
def get_recommendation():
    """Show a game the user would probably like"""

    recommendations = []
    games_info = []

    systems = request.args.getlist("systems")
    genres = request.args.getlist("genres")

    filt_games = db.session.query(Game.game_id).join(GameSystem, GameGenre).filter(GameSystem.system_id.in_(systems),GameGenre.genre_id.in_(genres)).all()    

    filt_games = [game[0] for game in filt_games]

    for game in filt_games:
        sims = get_all_similarities(game)
        raw_pred = predict(sims, users, game)

        if raw_pred > 3.0:
            recommendation = (game, raw_pred)
            recommendations.append(recommendation)
    for rec in recommendations:
        one_game_info = Game.query.filter(Game.game_id==rec[0]).first()
        name = one_game_info.name
        if isinstance(rec[1], (str, unicode)) == False:
            percentage = round(rec[1] * 20, 2)
        else:
            percentage = rec[1]
        games_info.append({"name": name, "percentage": percentage})

    return render_template("recommendation.html", games_info=games_info)


# @app.route("/search.json")
# def search_for_game():
#     """This is me testing out doing the below function in AJAX"""

#     game = request.args.get("searchField")
#     game_info = Game.query.filter(Game.name.like("%"+game+"%")).first()
#     game_id = games.index(game_info.game_id)
#     systems = db.session.query(System.name).join(GameSystem).filter(GameSystem.game_id==game_id).all()
#     print "Printing systems in /search.json"
#     print systems
#     genres = db.session.query(Genre.name).join(GameGenre).filter(GameGenre.game_id==game_id).all()
#     print "Printing genres in /search.json"
#     print genres

#     game_stuff = {"name": game_info.name, 
#                   "systems": systems,
#                   "genres": genres}

#     return jsonify(game_stuff)


@app.route("/search")
def search_game():
    """Handle search, render game details page"""

    game = request.args.get("search").title()
    game_info = Game.query.filter(Game.name.like("%"+game+"%")).first()
    if game_info:
        game_id = game_info.game_id
    else:
        game_id = 0

    return redirect("games/" + str(game_id))

@app.route("/games/<game_id>")
def show_game_details(game_id):

    user_id = session["user_id"]
    rating = Rating.query.filter(Rating.user_id==user_id, Rating.game_id==game_id).first()
    game_info = Game.query.filter_by(game_id=game_id).first()

    return render_template("game_details.html", game_info=game_info, rating=rating)


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
    systems = request.form.getlist("systems")
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
        get_user_rating(users, new_user, games)

        return redirect("/")

@app.route("/login", methods=["GET"])
def attempt_login():
    """Show login page"""

    return render_template("welcome.html")


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
        return redirect('/homepage')

    elif existing_email is None:
        flash("Incorrect email.")
        return redirect('/')
    else:
        flash("Incorrect password.")
        return redirect('/')

@app.route("/logout")
def do_logout():
    """Log user out."""

    flash("Goodbye!")
    session["user_id"] = ""

    return redirect("/")

def get_user_rating(users, user, games):
    """Get all ratings for all users"""

    userrating = {}

    for game in games:
        gamerating = Rating.query.filter_by(game_id=game, user_id=user.user_id).first()
        if gamerating:
            userrating[game] = gamerating.score
        else:
            userrating[game] = 0

            users[user.user_id] = userrating

    print users

    return users

def get_similarities(target_user, target_game):
    """Get the similarity between users based on ratings"""

    sims = {}

    for i, user in enumerate(users):
        if user != target_user and user[target_game]:
            red_users = filt(user, target_user, games)
            if red_users[0]:
                sim = pearson(zip(red_users[0], red_users[1]))
                sims[i] = sim

    return sims

def get_all_similarities(target_game):
    """Get the similarity between users based on ratings"""

    sims = {}

    for user in users.items():
        if user[0] != session['user_id'] and user[1][target_game]:
            print "Made it!"
            red_users = filt_all(user[0], session['user_id'], games)

            sim = pearson(zip(red_users[0], red_users[1]))
            sims[user[0]] = sim

    print sims

    return sims


def predict(sims, users, target_game):
    """Predict similarity"""

    pos_numerator = sum(sim * users[i][target_game] for i, sim in sims.items() if sim >= 0)
    neg_numerator = sum(-sim * (6 - users[i][target_game]) for i, sim in sims.items() if sim <0)
    denominator = sum(sim for i, sim in sims.items())
 
    result = "Need more data to predict!" if denominator == 0 else (pos_numerator + neg_numerator) / denominator
    print "Printing prediction result"
    print denominator
    print result
    return result

#*****************************************************************************#

if __name__ == "__main__":

    from flask import Flask

    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)
    print "Connected to DB."

    games = [game.game_id for game in db.session.query(Game.game_id).all()]

    users = {}
    print User.query.all()
    for user in User.query.all():
        users = get_user_rating(users, user, games)

    from pprint import pprint
    # pprint(users)
    print games
        

    app.run(port=5000, host='0.0.0.0')








