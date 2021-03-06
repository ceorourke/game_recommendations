import codecs
from igdb_api_python.igdb import igdb
import json
import sys
import os
reload(sys)
sys.setdefaultencoding('utf8')

igdb = igdb(os.environ.get("IGDB_KEY"))

def get_all_games():
    """Makes API calls to get game information"""

    platforms = [130, 48, 49, 37, 46, 41, 5, 47, 56, 4, 21, 19, 18, 58, 20, 22, 33, 24,
                87, 7, 8, 9, 38, 45, 11, 12, 36, 92, 14, 6, 13, 64, 29, 35, 32, 23, 34,
                39, 86, 51, 15, 13 ,79, 80, 119, 120, 135, 136]
    # get the list of games per platform
    systems_json = igdb.platforms({
        'ids':platforms,
        'fields' : 'games'
    })
    # dump the data into a file
    with open('systemsfile2.json', 'w') as fp:
            json.dump(systems_json, fp)

    for platform_id in platforms: 
        # loop through each platform and get the game info
        game_ids = igdb.platforms({
            'ids':platform_id,
            'fields' : ['games','name']
        })[0]["games"]

        num_games = len(game_ids)

        num_iterations = (num_games / 1000) + 1
        fields = ['id', 'name', 'genres', 'storyline', 'summary', 'cover', 'screenshots', 'videos']

        for i in range(num_iterations):

            platform_games = igdb.games({
                'ids':game_ids[i*1000:i*1000+1000],
                'fields' : ['id', 'name', 'genres', 'storyline', 'summary', 'cover', 'screenshots', 'videos']
            })
        with open('testfile' + str(platform_id) + '.json', 'w') as fp:
            json.dump(platform_games, fp)

get_all_games()