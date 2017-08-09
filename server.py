
from flask import Flask, jsonify, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db
from model import User, Following, Rating, Game, System, Genre, UserSystem, GameGenre, GameSystem
from jinja2 import StrictUndefined
from datetime import datetime
import os
from igdb_api_python.igdb import igdb
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# TODO update this to be actually secret
app.secret_key = "SECRETSECRETSECRET"

app.jinja_env.undefined = StrictUndefined

REQUEST_URL = "https://api-2445582011268.apicast.io"

igdb = igdb("cf604caa11e4b850c531cd0e2c91556d")
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

    return render_template("user_profile.html", user_info=user_info,
                                                system_info=system_info)


@app.route("/search")
def search_game():
    """Handle search"""

    # for right now, enter 1096 which is the game_id of DK64
    game = int(request.args.get("search"))
    # finds the info for the game with the id 1096
    game_info = igdb.games(game)

    return render_template("game_details.html", game_info=game_info)


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

        # TODO probably change this to go to the user's profile page?
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

    app.run(port=5000, host='0.0.0.0')