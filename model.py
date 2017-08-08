"""Models and database functions for gamesdb."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

#*****************************************************************************#

class User(db.Model):
    """User model."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    username = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(20), nullable=False)
    account_created = db.Column(db.DateTime, nullable=False)

    follower = db.relationship("Following",
                              secondary="following",
                              primaryjoin="User.user_id==Following.follower",
                              secondaryjoin="User.user_id==Following.followee")

    followee = db.relationship("Following",
                              secondary="following",
                              primaryjoin="User.user_id==Following.followee",
                              secondaryjoin="User.user_id==Following.follower")

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<User user_id=%s username=%s password=%s>"

        # TODO probably remove password when not in development
        return s % (self.user_id, self.username, self.password)

class Following(db.Model):
    """Following model."""

    __tablename__ = "following"

    following_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    follower = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    followee = db.Column(db.Integer, db.ForeignKey("users.user_id"),nullable=False)
    following_since = db.Column(db.DateTime, nullable=False)


    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Following following_id=%s follower=%s followee=%s>"

        return s % (self.following_id, self.follower, self.followee)

class Rating(db.Model):
    """Rating model."""

    __tablename__ = "ratings"

    rating_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("games.game_id"), nullable=False)
    score = db.Column(db.Integer, nullable=False)

    user = db.relationship("User", backref=db.backref("ratings"))
    game = db.relationship("Game", backref=db.backref("ratings"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Rating rating_id=%s user_id=%s game_id=%s score=%s>"

        return s % (self.rating_id, self.user_id, self.game_id, self.score)


class Game(db.Model):
    """Game model."""

    __tablename__ = "games"

    # game_id is from the API
    game_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    name = db.Column(db.String(100), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Game game_id=%s name=%s>"

        return s % (self.game_id, self.name)

class System(db.Model):
    """System model."""

    __tablename__ = "systems"

    # system_id is from the API
    system_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<System system_id=%s name=%s>"

        return s % (self.system_id, self.name)

class Genre(db.Model):
    """Genre model."""

    __tablename__ = "genres"

    # genre_id is from the API
    genre_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Genre genre_id=%s name=%s>"

        return s % (self.genre_id, self.name)


class UserSystem(db.Model):
    """Association table between User and System."""

    __tablename__ = "usersystems"

    usersystem_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    system_id = db.Column(db.Integer, db.ForeignKey("systems.system_id"), nullable=False)

    user = db.relationship("User", backref=db.backref("usersystems"))
    system = db.relationship("System", backref=db.backref("usersystems"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<UserSystem usersystem_id=%s user_id=%s system_id=%s>"

        return s % (self.usersystem_id, self.user_id, self.system_id)


class GameGenre(db.Model):
    """Association table between Game and Genre."""

    __tablename__ = "gamegenres"

    gamegenre_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("games.game_id"), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey("genres.genre_id"), nullable=False)

    game = db.relationship("Game", backref=db.backref("gamegenres"))
    genre = db.relationship("Genre", backref=db.backref("gamegenres"))


    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Gamegenre gamegenre_id=%s game_id=%s genre_id>"

        return s % (self.gamegenre_id, self.game_id, self.genre_id)

class GameSystem(db.Model):
    """Association table betwen Game and System."""

    __tablename__ = "gamesystems"

    gamesystem_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("games.game_id"), nullable=False)
    system_id = db.Column(db.Integer, db.ForeignKey("systems.system_id"), nullable=False)

    game = db.relationship("Game", backref=db.backref("gamesystems"))
    system = db.relationship("System", backref=db.backref("gamesystems"))

#*****************************************************************************#

def init_app():
    # So that we can use Flask-SQLAlchemy, we'll make a Flask app.
    from flask import Flask
    app = Flask(__name__)

    connect_to_db(app)
    print "Connected to DB."


def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our database.
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres:///games'
    app.config['SQLALCHEMY_ECHO'] = False
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


# if __name__ == "__main__":
#     # As a convenience, if we run this module interactively, it will leave
#     # you in a state of being able to work with the database directly.

#     # So that we can use Flask-SQLAlchemy, we'll make a Flask app.
#     from flask import Flask

#     app = Flask(__name__)

#     connect_to_db(app)
#     print "Connected to DB."

    # later on move this to the server.py file and import connect_to_db and db