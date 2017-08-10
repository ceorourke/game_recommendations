"""Seeds system data into db"""

from sqlalchemy import func
from model import System, Genre, Game, GameGenre, GameSystem
from model import connect_to_db, db
from server import app

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

    for row in open("seed_data/games.txt"):
        row = row.rstrip()
        try: 
            system_id, game_id, name, genre_id = row.split("|")
        except:
            game_info = row.split("|")
            system_id = game_info[0]
            game_id = game_info[1]
            name = game_info[2] + game_info[3]
            genre_id = game_info[4]
            print row

        game = Game.query.filter_by(game_id=game_id).first()

        if not game:

            game = Game(game_id=game_id, name=name)

            db.session.add(game)
            db.session.commit()

        genre_id = clean_up_list(genre_id)
        print genre_id

        for genre in genre_id:
            game_genre = GameGenre(game_id=game_id, genre_id=genre  )
            db.session.add(game_genre)
            db.session.commit()

        for system in system_id:
            game_system = GameSystem(game_id=game_id, system_id=system_id)
            db.session.add(game_system)
            db.session.commit()

#*****************************************************************************#


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    load_systems()
    load_genres()
    load_games()    