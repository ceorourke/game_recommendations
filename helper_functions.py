"""These are all the functions that power the game recommendations. These functions
utilize the Pearson correlation and are inspired by an exercise in machine learning
at Hackbright Academy where we rated movies.

The similarity between users is calculated using a weighted average. 
Users who are more strongly correlated (negatively and positively) are given a
higher weight, as they have more predictive power. i.e. if user A and user B
have a strong positive correlation, user B's 5 star rating on a game is a good
indicator that user a will also rate it at 5. Similarly, if user A and user C
have a strong negative correlation, user C's 1 star rating on a game is a good
indicator that user A will rate that game a 5. """

from math import sqrt

def get_all_similarities(target_game, users, games, user_id):
    """Get the similarity between users based on ratings"""

    # print "Printing inputs of get_all_similarities"
    # print target_game

    sims = {}

    for user in users.items():
        # if user[0] != session['user_id'] and user[1][target_game]:
        if user[0] != user_id and user[1]:
            # print "Made it to get_all_similarities!"
            # red_users = filt_all(user[0], session['user_id'], games, users)
            red_users = filt_all(user[0], user_id, games, users)
            # print "Printing red_users from get_all_similarities"
            # print red_users
            red_users = [(x[0], x[1]) for x in red_users]

            # sim = pearson(zip(red_users[0], red_users[1]))
            try:
                sim = pearson(red_users)
                sims[user[0]] = sim
            except:
                raise Exception("Not enough similarities")

    # print "Printing sims from get_all_similarities"
    # print sims

    return sims

def filt_all(user1, user2, games, users):
    """Filter down lists to only include ratings they've both done"""
    # print "Printing users in filt_all"
    # from pprint import pprint
    # pprint(users)
    # print users
    games = sorted(games)
    result = []
    # print "Printing inputs from filt_all"
    # print user1, user2, games

    user1_ratings = [score for game_id, score in sorted(users[user1].items())]
    # print "Printing user1_ratings from filt_all"
    # print user1_ratings
    user2_ratings = [score for game_id, score in sorted(users[user2].items())]
    # print "Printing user2_ratings from filt_all"
    # print user2_ratings

    users_filt = zip(user1_ratings, user2_ratings, games)
    # print "Printing users_filt from filt_all"
    # print users_filt

    for u1, u2, game_id in users_filt:
        if u1 and u2:
            result.append((u1, u2, game_id))

    # print "Printing result from filt_all"
    # print result

    return result

def pearson(pairs):
    """Return Pearson correlation for pairs.

    Using a set of pairwise ratings, produces a Pearson similarity rating.
    """
    # print "Printing pearson pairs"
    # print pairs
    series_1 = [float(pair[0]) for pair in pairs]
    series_2 = [float(pair[1]) for pair in pairs]

    sum_1 = sum(series_1)
    sum_2 = sum(series_2)

    squares_1 = sum([n * n for n in series_1])
    squares_2 = sum([n * n for n in series_2])

    product_sum = sum([n * m for n, m in pairs])

    size = len(pairs)
    if size == 0:
        raise Exception("Not enough similarities")

    numerator = product_sum - (sum_1 * sum_2/float(size))

    denominator = sqrt(
        (squares_1 - (sum_1 * sum_1) / size) *
        (squares_2 - (sum_2 * sum_2) / size)
    )

    if denominator == 0:
        return 0

    # print "Printing pearson result"
    # print numerator / denominator

    return numerator / denominator

def predict(sims, users, target_game):
    """Predict similarity"""

    # print "Printing inputs from predict"
    # print sims
    err2 = [users[i][target_game] for i, sim in sims.items() if users[i][target_game] > 0]

    pos_numerator = sum(sim * users[i][target_game] for i, sim in sims.items() if sim >= 0 and users[i][target_game] > 0)
    neg_numerator = sum(-sim * (6 - users[i][target_game]) for i, sim in sims.items() if sim < 0 and users[i][target_game] > 0)
    denominator = sum(abs(sim) for i, sim in sims.items() if users[i][target_game] > 0)


    result = "Need more data to predict!" if denominator == 0 else (pos_numerator + neg_numerator) / denominator

    return result

def standard_deviation(ratings):
    """Calculate standard deviation of game ratings"""
    
    mean = sum(ratings) / float(len(ratings))
    deviations = [rating - mean for rating in ratings]
    sum_sq_deviations = sum([dev ** 2 for dev in deviations])
    return sqrt(sum_sq_deviations/(len(ratings)-1))

# def filt(user1, user2, games):
#     """Filter down lists to only include ratings they've both done"""

#     result = []

#     users = zip(user1, user2, games)

#     for u1, u2, game_id in users:
#         if u1 and u2:
#             result.append((u1, u2, game_id))

#     return result

# def get_similarities(target_user, target_game):
#     """Get the similarity between users based on ratings"""

#     sims = {}

#     for i, user in enumerate(users):
#         if user != target_user and user[target_game]:
#             red_users = filt(user, target_user, games)
#             if red_users[0]:
#                 sim = pearson(zip(red_users[0], red_users[1]))
#                 sims[i] = sim

#     return sims