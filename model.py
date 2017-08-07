"""Models and database functions for gamesdb."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

#*****************************************************************************#

class User(db.Model):
    """User model."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    username = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(20), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<User user_id=%s username=%s password=%s>"

        # remove password when not in development!!
        return s % (self.user_id, self.username, self.password)

class Lurker(db.Model):
    """Lurker model."""

    __tablename__ = "lurkers"

    lurker_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    follower = db.Column(db.String(50), db.ForeignKey("users.user_id"), nullable=False)
    followee = db.Column(db.String(50), db.ForeignKey("users.user_id"),nullable=False)

    # make these different somehow. one is the user id of the follower, other 
    # is the user id of the followee. Sarah said you can specify this somehow
    user = db.Relationship("User", backref=db.backref("users"))
    user = db.Relationship("User", backref=db.backref("users"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Lurker lurker_id=%s follower=%s followee=%s>"

        return s % (self.lurker_id, self.follower, self.followee)

class Rating(db.Model):
    """Rating model."""

    __tablename__ = "ratings"

    rating_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    # game_id = db.Column(db.Integer, db.ForeignKey( to api id???
    score = db.Column(db.Integer, nullable=False)

    user = db.Relationship("User", backref=db.backref("users"))
    # api_id = db.Relationship("") ??? 

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Rating rating_id=%s user_id=%s game_id=%s score=%s>"

        return s % (self.rating_id, self.user_id, self.game_id, self.score)


class Game(db.Model):
    """Game model."""

    __tablename__ = "games"

    api_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey("genres.genre_id"), nullable=False)
    name = db.Column(db.String(100), nullable=False)

    genre_id = db.Relationship("Genre", backref=db.backref("genres"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Game api_id=%s genre_id=%s name=%s>"

        return s % (self.api_id, self.genre_id, self.name)

class System(db.Model):
    """System model."""

    __tablename__ = "systems"

    api_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<System api_id=%s name=%s>"

        return s % (self.api_id, self.name)

class Genre(db.Model):
    """Genre model."""

    __tablename__ = "genres"

    api_id = db.Column(db.Integer, autoincrement=False, primary_key=True, nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Genre api_id=%s name=%s>"

        return s % (self.api_id, self.name)


class UserSystem(db.Model):
    """Association table between User and System."""

    __tablename__ = "usersystems"

    usersystem_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"), nullable=False)
    system_id = db.Column(db.Integer, db.ForeignKey("systems.system_id"), nullable=False)

    user = db.Relationship("User", backref=db.backref("users"))
    system = db.Relationship("System", backref=db.backref("systems"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<UserSystem usersystem_id=%s user_id=%s system_id=%s>"

        return s % (self.usersystem_id, self.user_id, self.system_id)


class GameGenre(db.Model):
    """Association table between Game and Genre."""

    __tablename__ = "gamegenres"

    gamegenre_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("game.game_id"), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey("genres.genre_id"), nullable=False)

    game_id = db.Relationship("Game", backref=db.backref("games"))
    genre_id = db.Relationship("Genre", backref=db.backref("genres"))


    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Gamegenre gamegenre_id=%s game_id=%s genre_id>"

        return s % (self.gamegenre_id, self.game_id, self.genre_id)




