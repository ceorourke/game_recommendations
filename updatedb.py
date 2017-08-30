import os
import json
from igdb_api_python.igdb import igdb
from flask import jsonify
from server import app
from model import connect_to_db, db
from model import System, Genre, Game, GameGenre, GameSystem, User, Rating, UserSystem, Screenshot, Video
import schedule
import time
igdb = igdb(os.environ.get("IGDB_KEY"))

# potentially check for new systems too? Could make a list of stuff to ignore (from
# allsystems so I don't have to worry about those, and also don't have to manually
# update if a new console comes out)

def check_for_new_games():
    """Make an API call and compare new games with existing db"""

    platforms = [130, 48, 49, 37, 46, 41, 5, 47, 56, 4, 21, 19, 18, 58, 20, 22, 33, 24,
            87, 7, 8, 9, 38, 45, 11, 12, 36, 92, 14, 6, 13, 64, 29, 35, 32, 23, 34,
            39, 86, 51, 15, 13 ,79, 80, 119, 120, 135, 136]
    to_add = {}
    # get the new list of games per platform
    systems_json = igdb.platforms({
        'ids':platforms,
        'fields' : 'games'
    })

    print type(systems_json[0])
    # get the existing list of games per platform
    existing_file = open('seed_data/systemsfile2.json')
    existing = existing_file.read()
    existing = json.loads(existing)
    # compare this list to the existing list
    for system in systems_json:
        for existing_systems in existing:
            if system['id'] == existing_systems['id']:
                for game in system['games']:
                    if game not in existing_systems['games']:
                        if system['id'] in to_add:
                            to_add[system['id']].append(game)
                        else:
                            to_add[system['id']] = [game]
            else:
                print "No differences"

    
    get_new_games(to_add)
    existing_file.close()
    # overwrite the old file with the new information
    with open('seed_data/systemsfile2.json', 'w') as fp:
            json.dump(systems_json, fp)


def get_new_games(to_add):
    """Make API calls to get game information"""

    for system, games in to_add.items():

        num_games = len(games)

        num_iterations = (num_games / 1000) + 1
        fields = ['id', 'name', 'genres', 'storyline', 'summary', 'cover', 'screenshots', 'videos']

        for i in range(num_iterations):

            platform_games = igdb.games({
                'ids':games[i*1000:i*1000+1000],
                'fields' : fields
            })

            for game in platform_games:
                add_games_to_database(game, system)


def add_games_to_database(game, system):
    """Add new games to database"""

    db_game = Game.query.get(game.get('id'))

    if not db_game:
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

    gamesys = GameSystem.query.filter_by(game_id=int(game.get('id')), system_id=system).first()
    if not gamesys:
        game_system = GameSystem(game_id=game.get('id'), system_id=system)
        db.session.add(game_system)

    db.session.commit()

if __name__ == "__main__":
    connect_to_db(app)

    schedule.every().week.do(check_for_new_games)

    while True:
        schedule.run_pending()
        time.sleep(1)

