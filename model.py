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
    storyline = db.Column(db.String(10000), nullable=True)
    summary = db.Column(db.String(10000), nullable=True)
    cover =  db.Column(db.String(10000), nullable=True)

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Game game_id=%s name=%s>"

        return s % (self.game_id, self.name)

class Screenshot(db.Model):
    """Screenshot model"""

    __tablename__ = "screenshots"

    screenshot_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    screenshot_url = db.Column(db.String(100), nullable=False)
    screenshot_width = db.Column(db.Integer, nullable=False)
    screenshot_height = db.Column(db.Integer, nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("games.game_id"), nullable=False)

    game = db.relationship("Game", backref=db.backref("screenshots"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Screenshot screenshot_id=%s screenshot_url%s screenshot_width=%s screenshot_height%s>"

        return s % (self.screenshot_id, self.screenshot_url, self.screenshot_width, self.screenshot_height)

class Video(db.Model):
    """Video model"""

    __tablename__ = "videos"

    video_id = db.Column(db.Integer, autoincrement=True, primary_key=True, nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey("games.game_id"), nullable=False)
    video_url = db.Column(db.String(100), nullable=False)
    video_name = db.Column(db.String(100), nullable=False)

    game = db.relationship("Game", backref=db.backref("videos"))

    def __repr__(self):
        """Provide useful info when printed to console"""

        s = "<Video video_id=%s video_url=%s video_name%s>"

        return s % (self.video_id, self.video_url, self.video_name)

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


def connect_to_db(app, location="postgres:///games"):
    """Connect the database to our Flask app."""

    # Configure to use our database.
    app.config['SQLALCHEMY_DATABASE_URI'] = location
    app.config['SQLALCHEMY_ECHO'] = False
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)

def example_data():
    """Load fake db with data for testing."""

    from datetime import datetime

    # make a system
    switch = System(system_id=130, name="Nintendo Switch")
    # make some genres
    music = Genre(genre_id=7, name="Music")
    platform = Genre(genre_id=8, name="Platform")
    puzzle = Genre(genre_id=9, name="Puzzle")
    racing = Genre(genre_id=10, name="Racing")
    rts = Genre(genre_id=11, name="Real Time Strategy (RTS)")
    rpg = Genre(genre_id=12, name="Role-playing (RPG)")
    sim = Genre(genre_id=13, name="Simulator")
    sport = Genre(genre_id=14, name="Sport")
    strategy = Genre(genre_id=15, name="Strategy")
    tbs = Genre(genre_id=16, name="Turn-based Strategy (TBS)")
    tac = Genre(genre_id=24, name="Tactical")
    hack = Genre(genre_id=25, name="Hack and slash/Beat 'em up")
    quiz = Genre(genre_id=26, name="Quiz/Trivia")
    pinball = Genre(genre_id=30, name="Pinball")
    adventure = Genre(genre_id=31, name="Adventure")
    indie = Genre(genre_id=32, name="Indie")
    arcade = Genre(genre_id=33, name="Arcade")
    pac = Genre(genre_id=2, name="Point-and-click")
    fight = Genre(genre_id=4, name="Fighting")
    shoot = Genre(genre_id=5, name="Shooter")
    # make some games
    botw = Game(game_id=7346, name="The Legend of Zelda: Breath of the Wild",
                storyline="Its a cool game with Zelda and Link", 
                summary="Waste your life playing this game", 
                cover="http://www.cutestpaw.com/wp-content/uploads/2016/02/Yawn..jpeg")
    dance = Game(game_id=19550, name="Just Dance 2017")
    mk8 = Game(game_id=26764, name="Mario Kart 8 Deluxe")
    splat = Game(game_id=26761, name="Splatoon 2")
    dis = Game(game_id=26768, name="Disgaea 5 Complete")
    voez = Game(game_id=27397, name="VOEZ")
    pokken = Game(game_id=36794, name="Pokken Tournament DX")
    shovel = Game(game_id=27240, name="Shovel Knight: Shovel of Hope")
    fire = Game(game_id=26845, name="Fire Emblem for Nintendo Switch")
    yoku = Game(game_id=27367, name="Yoku's Island Express")
    # make some users

    now = datetime.now()
    hellboy = User(user_id=11, username="hellboy", email="hellboy@cute.com", 
                   password="hellboy", account_created=now)
    colleen = User(user_id=12, username="colleen", email="colleen@colleen.com",
                   password="colleen", account_created=now)
    leo = User(user_id=3, username="leo", email="leo@leo.com",
                   password="leo", account_created=now)
    eric = User(user_id=4, username="eric", email="eric@eric.com",
                   password="eric", account_created=now)
    laura = User(user_id=5, username="laura", email="laura@laura.com",
                   password="laura", account_created=now)
    jennie = User(user_id=6, username="jennie", email="jennie@jennie.com",
                   password="jennie", account_created=now)
    paula = User(user_id=7, username="paula", email="paula@paula.com",
                   password="paula", account_created=now)
    erin = User(user_id=8, username="erin", email="erin@erin.com",
                   password="erin", account_created=now)
    jess = User(user_id=9, username="jess", email="jess@jess.com",
                   password="jess", account_created=now)
    jenn = User(user_id=10, username="jenn", email="jenn@jenn.com",
                   password="jenn", account_created=now)

    db.session.add_all([switch, music, platform, puzzle, racing, rts, rpg, sim,
                        sport, strategy, tbs, tac, hack, quiz, pinball, adventure,
                        indie, arcade, pac, fight, shoot, botw, dance, mk8, splat,
                        dis, voez, pokken, shovel, fire, yoku, hellboy, colleen,
                        leo, eric, laura, jennie, paula, erin, jess, jenn])
    db.session.commit()

    # make some ratings
    users = db.session.query(User.user_id).all()
    games = db.session.query(Game.game_id).all()

    # GameGenre for Zelda
    botw_genre = GameGenre(gamegenre_id=1, game_id=7346, genre_id=12)
    # GameSystem for Zelda
    botw_system = GameSystem(gamesystem_id=1, game_id=7346, system_id=130)
    # Video for Zelda
    botw_video = Video(video_id=1, game_id=7346, video_url="Z6BeAtdoELY", video_name="Trailer")
    # Screenshot for Zelda
    botw_ss = Screenshot(screenshot_id=1, screenshot_url="http://www.cutestpaw.com/wp-content/uploads/2016/02/Yawn..jpeg", 
                         screenshot_width=1920, screenshot_height=1080, game_id=7346)

    db.session.add_all([botw_genre, botw_system, botw_video, botw_ss])

    from seed import load_usersystems, load_ratings
    # make all users own all systems
    load_usersystems()
    # make all users rate all games
    load_ratings()


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    # So that we can use Flask-SQLAlchemy, we'll make a Flask app.
    from flask import Flask

    app = Flask(__name__)

    connect_to_db(app)
    print "Connected to DB."

    # later on move this to the server.py file and import connect_to_db and db

