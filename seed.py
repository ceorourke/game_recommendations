"""Seeds system data into db"""

from sqlalchemy import func
from model import System, Genre, Game, GameGenre, GameSystem, User, Rating
from model import connect_to_db, db
from server import app
from random import randint

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

    """delete info in case this is run twice, won't dupe data"""
    Game.query.delete()
    GameGenre.query.delete()

    for row in open("seed_data/games_test.txt"):
        row = row.rstrip()
        try: 
            system_id, game_id, name, genre_id = row.split("|")
        except:
            game_info = row.split("|")
            system_id = game_info[0]
            game_id = game_info[1]
            name = game_info[2] + game_info[3]
            genre_id = game_info[4]

        game = Game.query.filter_by(game_id=game_id).first()

        if not game:

            game = Game(game_id=game_id, name=name)

            db.session.add(game)
            db.session.commit()

        genre_id = clean_up_list(genre_id)

        for genre in genre_id:
            gamegen = GameGenre.query.filter_by(game_id=game_id, genre_id=genre).first()
            if not gamegen:
                game_genre = GameGenre(game_id=game_id, genre_id=genre)
                db.session.add(game_genre)
                db.session.commit()

        for system in system_id:
            gamesys = GameSystem.query.filter_by(game_id=game_id, system_id=system_id).first()
            if not gamesys:
                game_system = GameSystem(game_id=game_id, system_id=system_id)
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
    load_ratings()
    print "Loaded ratings..."
    set_val_user_id()
    print "Seeding complete."