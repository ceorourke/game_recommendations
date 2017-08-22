"""Seeds system data into db"""

from sqlalchemy import func
from model import System, Genre, Game, GameGenre, GameSystem, User, Rating, UserSystem, Screenshot, Video
from model import connect_to_db, db
from server import app
from random import randint
import json
import sqlalchemy

#*****************************************************************************#

def load_systems():
    """Load systems from systems.txt into database"""

    """delete info in case this is run twice, won't dupe data"""
    System.query.delete()

    for row in open("seed_data/systems.txt"):
        row = row.rstrip()
        system_id, name = row.split("|")

        system = System(system_id=system_id, name=name)

        db.session.add(system)
        db.session.commit()


def load_genres():
    """Load genres from genres.txt into database"""

    """delete info in case this is run twice, won't dupe data"""
    Genre.query.delete()

    for row in open("seed_data/genres.txt"):
        row = row.rstrip()
        genre_id, name = row.split("|")

        genre = Genre(genre_id=genre_id, name=name)

        db.session.add(genre)

        db.session.commit()

def clean_up_list(x):
    """Takes in a list formatted as a string and reformats it as a list"""

    x = x.strip("[]")
    x = x.replace(",", "")
    x = x.split()
    x = [int(y) for y in x]

    return x

def load_games():
    """Load games from games.txt into database"""

    # delete info in case this is run twice, won't dupe data
    Game.query.delete()
    GameGenre.query.delete()

    platform_games = json.load(open('seed_data/testfile.json'))
    system_ids = json.load(open('seed_data/systemsfile.json'))

    fields = ['id', 'name', 'genres', 'storyline', 'summary', 'cover', 'screenshots', 'videos']

    for game in platform_games:
        if game.get("screenshots"):
            for screenshot in game["screenshots"]:
                screenshot = Screenshot(screenshot_url=screenshot["url"],
                                         screenshot_width=screenshot["width"],
                                         screenshot_height=screenshot["height"],
                                         game_id=game["id"])

                db.session.add(screenshot)

        if game.get("videos"):
            for video in game["videos"]:
                video =  Video(game_id=game["id"],
                               video_url=video["video_id"],
                               video_name=video["name"])

                db.session.add(video)

        cover = None

        if game.get("cover"):
            cover = game.get("cover").get("url")

        new_game = Game(game_id=game["id"], name=game["name"], storyline=game.get("storyline"),
                    summary=game.get("summary"), cover=cover)

        db.session.add(new_game)
        db.session.commit()

        if game.get("genres"):
            genre_ids = game["genres"]
            for genre in genre_ids:
                gamegen = GameGenre.query.filter_by(game_id=game["id"], genre_id=genre).first()
                if not gamegen:
                    game_genre = GameGenre(game_id=game["id"], genre_id=genre)
                    db.session.add(game_genre)

    for system in system_ids:
        for game in system["games"]:
            gamesys = GameSystem.query.filter_by(game_id=game, system_id=system["id"]).first()
            if not gamesys:
                game_system = GameSystem(game_id=game, system_id=system["id"])
                db.session.add(game_system)

    db.session.commit()


def load_users():
    """Load fake users for testing from file"""

    User.query.delete()

    for row in open("seed_data/MOCK_DATA_test.csv"):
        row = row.rstrip()
        user_id, username, email, password, account_created = row.split(",")

        user = User(user_id=user_id, username=username, email=email, 
                    password=password, account_created=account_created)

        db.session.add(user)
        db.session.commit()

def load_usersystems():
    """Make all users own systems"""

    users = db.session.query(User.user_id).all()
    systems = db.session.query(System.system_id).all()

    for user in users:
        for system in systems:
            usersystem = UserSystem(user_id=user, system_id=system)
            db.session.add(usersystem)
            db.session.commit()
        print "Added systems for user #", user[0]

def load_ratings():
    """Load fake ratings for testing"""

    Rating.query.delete()

    users = db.session.query(User.user_id).all()
    games = db.session.query(Game.game_id).all()

    for user in users:
        for game in games:
            rating = randint(1,5)
            user_rating = Rating(user_id=user, game_id=game, score=rating)
            db.session.add(user_rating)
            db.session.commit()
        print "Added ratings for user #", user[0]


def set_val_user_id():
    """Set value for the next user_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(User.user_id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()


#*****************************************************************************#


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    load_systems()
    print "Loaded systems..."
    load_genres()
    print "Loaded genres..."
    load_games()
    print "Loaded games..."
    load_users()
    print "Loaded users..."
    load_usersystems()
    print "Loaded systems for users"
    load_ratings()
    print "Loaded ratings..."
    set_val_user_id()
    print "Seeding complete."