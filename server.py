
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
    system_info = UserSystem.query.filter_by(user_id=user_id).all()
    rating_info = db.session.query(Game.name, Rating.score).join(Rating).filter(Rating.user_id==user_id).all()

    return render_template("user_profile.html", user_info=user_info,
                                                system_info=system_info,
                                                rating_info=rating_info)

@app.route("/recommendation")
def get_recommendation():
    """Show a game the user would probably like"""

    recommendations = []
    game_ids = db.session.query(Game.game_id).all()
    # get maybe just the first 10 game ids to test!!
    # game_ids = game_ids[0:30]
    print "Printing first game id"
    print game_ids[0][0]

    current_user = session["user_id"]
    target_user = users[current_user-1]
    # target_game = game_ids[0]

    for target_game in game_ids:
        print "Printing target_game"
        print target_game
        sims = get_similarities(target_user, target_game[0])
        raw_pred = predict(sims, users, target_game)

        if raw_pred > 2.0:

            recommendation = (target_game, raw_pred)
            recommendations.append(recommendation)

    one_rec = choice(recommendations)
    game_info = Game.query.filter(Game.game_id==one_rec[0]).first()
    game_info = game_info.name
    print "Printing one_rec"
    print one_rec
    print type(one_rec)
    percentage = raw_pred * 5

    return render_template("recommendation.html", game_info=game_info, percentage=percentage)


@app.route("/search")
def search_game():
    """Handle search, render game details page"""
    print "Getting game info"
    game = request.args.get("search")
    game_info = Game.query.filter(Game.name.like("%"+game+"%")).first()
    game_id = games.index(game_info.game_id)

    print "Getting user info ..."
    
    current_user = session["user_id"]
    target_user = users[current_user-1]
    target_game = game_id

    print "Getting similarities..."
    sims = get_similarities(target_user, target_game)
    print "Sims size: {}".format(len(sims))
    print "Getting predictions..."
    raw_pred = predict(sims, users, target_game)
    print "Raw prediction is {}".format(raw_pred)
    print "Rounding..."
    prediction = round(raw_pred, 2)

    return render_template("game_details.html", game_info=game_info, prediction=prediction)


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

    sims = {}
    for i, user in enumerate(users):
        print "Printing in get_similarities"
        if user != target_user and user[target_game]:
            red_users = filt(user, target_user, games)
            print "This is the red_users"
            print red_users
            if red_users[0]:
                sim = pearson(zip(red_users[0], red_users[1]))
                sims[i] = sim
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
    users = [[Rating.query.filter_by(user_id=user.user_id, game_id=game_id
              ).first().score if Rating.query.filter_by(user_id=user.user_id, 
                                        game_id=game_id).first() else 0 for game_id in games] for user in User.query.all()]

    app.run(port=5000, host='0.0.0.0')