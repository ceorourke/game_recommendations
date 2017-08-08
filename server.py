
from flask import Flask, jsonify, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db
from model import User, Following, Rating, Game, System, Genre, UserSystem, GameGenre, GameSystem
from jinja2 import StrictUndefined
from datetime import datetime
import os
from igdb_api_python.igdb import igdb

app = Flask(__name__)
# TODO update this to be actually secret
app.secret_key = "SECRETSECRETSECRET"

app.jinja_env.undefined = StrictUndefined

REQUEST_URL = "https://api-2445582011268.apicast.io"
#*****************************************************************************#

@app.route("/")
def homepage():
    """Show homepage"""

    return render_template("homepage.html")


@app.route("/register", methods=["GET"])
def register():
    """Show registration form"""

    return render_template("registration.html")


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
    # TODO need to store the systems somewhere, also need to create a Jinja
    # for loop to generate the checkboxes in the registration form
    # but first need to figure out the API

        db.session.add(new_user)
        db.session.commit()

        # for system in systems:


        # TODO probably change this to go to the user's profile page?
        flash("Successfully registered " + username + "!")
        return redirect("/")

    else:
        flash("Username or email already in use")
        # TODO probably handle this in AJAX on the form and be more specific
        # as to whether it was the username or email that failed
        return redirect("/")


@app.route("/user/<user_id>")
def user_profile(user_id):
    """Show user profile"""

    user_info = User.query.filter_by(user_id=user_id).first()

    return render_template("user_profile.html", user_info=user_info)

#*****************************************************************************#

if __name__ == "__main__":

    from flask import Flask

    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)
    print "Connected to DB."

    app.run(port=5000, host='0.0.0.0')