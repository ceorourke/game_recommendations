import codecs
from igdb_api_python.igdb import igdb
import json
import sys
import os
reload(sys)
sys.setdefaultencoding('utf8')

igdb = igdb(os.environ.get("IGDB_KEY"))

# def get_all_games():
#     platforms = [130, 48, 49, 37, 46, 41, 5, 47, 56, 4, 21, 19, 18, 58, 20, 22, 33, 24,
#                 87, 7, 8, 9, 38, 45, 11, 12, 36, 92, 14, 6, 13, 64, 29, 35, 32, 23, 34,
#                 39, 86, 51, 15, 13 ,79, 80, 119, 120, 135, 136]

#     for platform_id in platforms: 

#         game_ids = igdb.platforms({
#             'ids':platform_id,
#             'fields' : ['games','name']
#         })[0]["games"]

#         num_games = len(game_ids)

#         num_iterations = (num_games / 1000) + 1

#         for i in range(num_iterations):

#             platform_games = igdb.games({
#                 'ids':game_ids[i*1000:i*1000+1000],
#                 'fields' : ['id', 'name', 'genres']
#             })

#             for game in platform_games:
#                 print "{platform_id}|{id}|{name}|{genres}".format(platform_id=platform_id, name = game["name"].encode('utf-8'), genres=game.get("genres", []), id=game["id"])

# get_all_games()

def get_all_games():
    """Makes API calls to get game information"""

    # add all platforms later! this is just switch games for testing
    platforms = [130, 48]


    systems_json = igdb.platforms({
        'ids':platforms,
        'fields' : 'games'
    })

    print len(systems_json)


    return
    with open('systemsfile2.json', 'w') as fp:
            json.dump(systems_json, fp)

    for platform_id in platforms: 

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


