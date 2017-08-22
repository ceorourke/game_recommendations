from math import sqrt

def pearson(pairs):
    """Return Pearson correlation for pairs.

    Using a set of pairwise ratings, produces a Pearson similarity rating.
    """
    print "Printing pearson pairs"
    print pairs
    series_1 = [float(pair[0]) for pair in pairs]
    series_2 = [float(pair[1]) for pair in pairs]

    sum_1 = sum(series_1)
    sum_2 = sum(series_2)

    squares_1 = sum([n * n for n in series_1])
    squares_2 = sum([n * n for n in series_2])

    product_sum = sum([n * m for n, m in pairs])

    size = len(pairs)

    numerator = product_sum - ((sum_1 * sum_2)/size)

    denominator = sqrt(
        (squares_1 - (sum_1 * sum_1) / size) *
        (squares_2 - (sum_2 * sum_2) / size)
    )

    if denominator == 0:
        return 0
    print "Printing pearson result"
    print numerator / denominator

    return numerator / denominator


def filt_all(user1, user2, games):
    """Filter down lists to only include ratings they've both done"""

    result = []

    user1_ratings = [score for game_id, score in sorted(users[user1].items())]
    user2_ratings = [score for game_id, score in sorted(users[user2].items())]

    users_filt = zip(user1_ratings, user2_ratings, games)

    for u1, u2, game_id in users_filt:
        if u1 and u2:
            result.append((u1, u2, game_id))

    print result

    return result

def filt(user1, user2, games):
    """Filter down lists to only include ratings they've both done"""

    result = []

    users = zip(user1, user2, games)

    for u1, u2, game_id in users:
        if u1 and u2:
            result.append((u1, u2, game_id))

    return result