import server
import unittest
from server import *
from helper_functions import *
from seed import *
from model import *
import os

class ServerTestsWithSession(unittest.TestCase):
    """Tests for the game recommendations site that require session"""

    def setUp(self):
        """Code to run before every test."""

        self.client = server.app.test_client()
        server.app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'key'

        # Connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data
        db.create_all()
        example_data()
        with self.client as c:
          with c.session_transaction() as sess:
              sess['user_id'] = 1

    def tearDown(self):
        """Do at end of every test."""

        db.session.close()
        db.drop_all()

    def test_logout(self):
        """Can we log out a user that's been logged in?"""

        result = self.client.get("/logout", follow_redirects=True)
        self.assertIn("Goodbye!", result.data)


    def test_homepage(self):
        """Can we log in and reach the homepage?"""

        result = self.client.get("/homepage")
        self.assertIn('Get a game recommendation', result.data)
        self.assertIn('Filter by system', result.data)
        self.assertIn('Filter by genre', result.data)

    def test_login_fail_pw(self):
        """Can we reject a user with the wrong password?"""

        result = self.client.post("/login", data={"email": "hellboy@cute.com",
                                                  "password": "jfsghjkdfhgh"},
                                                  follow_redirects=True)
        self.assertIn("Incorrect password.", result.data)

    def test_login_fail_email(self):
        """Can we reject a user with the wrong email?"""

        result = self.client.post("/login", data={"email": "stuff@stuff.com",
                                                  "password": "jfsghjkdfhgh"},
                                                  follow_redirects=True)
        self.assertIn("Incorrect email.", result.data)

    def test_search(self):
        """Can we search for a game and reach the game details page?"""

        result = self.client.get("/games/7346")
        self.assertIn("The Legend of Zelda: Breath of the Wild", result.data)
        self.assertIn("Rating:", result.data)
        self.assertIn("Systems:", result.data)
        self.assertIn("Nintendo Switch", result.data)
        self.assertIn("Genres:", result.data)
        self.assertIn("Role-playing (RPG)", result.data)
        self.assertIn('<img src="http://www.cutestpaw.com/wp-content/uploads/2016/02/Yawn..jpeg" style="width:100px;">', result.data)
        self.assertIn("Its a cool game with Zelda and Link", result.data)
        self.assertIn("Waste your life playing this game", result.data)
        self.assertIn('<iframe width="420" height="315" allowfullscreen', result.data)
        self.assertIn('src="http://www.youtube.com/embed/Z6BeAtdoELY ">', result.data)
        self.assertIn('<img src="http://www.cutestpaw.com/wp-content/uploads/2016/02/Yawn..jpeg" style="width:1920px height:1080;">', result.data)

    def test_search_not_found(self):
        """Can we see the right page when a game isn't found?"""

        result = self.client.get("/games/0")
        self.assertIn("No game found by that name. Please try again.", result.data)

    def test_recommendation(self):
        """Can we get a game recommendation?"""

        result = self.client.get("/recommendation", data={"systems": [130],
                                                          "genres": [12]})
        self.assertIn("Zelda", result.data)

    def test_profile(self):
        """Can we get to the user's profile page?"""

        result = self.client.get("/user/11")
        self.assertIn("hellboy", result.data)
        self.assertIn("hellboy@cute.com", result.data)
        self.assertIn("User Since:", result.data)
        self.assertIn("Systems:", result.data)
        self.assertIn("Nintendo Switch", result.data)
        self.assertIn("Games I've Rated:", result.data)



class ServerTestsWithoutSession(unittest.TestCase):
    """Tests for the game recommendations site"""

    def setUp(self):
        """Code to run before every test."""
        
        connect_to_db(app, "postgresql:///testdb")
        self.client = server.app.test_client()
        server.app.config['TESTING'] = True

        # os.system("createdb testdb")

        # Connect to test database
        

        # import pdb; pdb.set_trace()

        # Create tables and add sample data
        db.create_all()
        example_data()

        def mock_get_user_rating(users, user, games):
            pass
        self.old_function = server.get_user_rating
        server.get_user_rating = mock_get_user_rating
        server.users = server.games = []

    def tearDown(self):
        """Do at end of every test."""

        db.session.close()
        db.drop_all()
        server.get_user_rating = self.old_function
        # os.system("dropdb testdb")


    def test_welcome_page(self):
        """Can we reach the welcome page?"""

        result = self.client.get("/")
        self.assertIn('Login or <a href="/register">Register</a>', result.data)

    def test_registration_page(self):
        """Can we reach the registration page?"""

        result = self.client.get("/register")
        self.assertIn('Registration Form', result.data)

    def test_registration(self):
        """Can we register a new user?"""

        result = self.client.post("/register", data={"username": "cree",
                                                     "email": "cree@cree.com",
                                                     "password": "cree",
                                                     "systems": ["Nintendo Switch"],
                                                     }, follow_redirects=True)
        self.assertIn("/login", result.data)

    def test_login_success(self):
        """Can we log in a registered user?"""

        result = self.client.post("/login", data={"email": "hellboy@cute.com",
                                                  "password": "hellboy"},
                                                  follow_redirects=True)
        self.assertIn("/homepage", result.data)
        self.assertIn("Successfully logged in!", result.data)

class RecommendationAlgorithmTests(unittest.TestCase):
    """Tests all functions that generate the recommendations"""

    def setUp(self):
        """Code to run before every test."""

        # global games
        # global users

        self.games = [38983, 10232, 27081, 21063, 11667, 17000, 7346, 26764, 19550, 19554]
        self.users = {
                 10: {38983: 5, 10232: 4, 27081: 4, 21063: 2, 11667: 1, 
                      17000: 4, 7346: 1, 26764: 3, 19550: 2, 19554:4},
                 11: {38983: 5, 10232: 4, 27081: 4, 21063: 2, 11667: 1, 
                      17000: 4, 7346: 1, 26764: 3, 19550: 2, 19554:4},
                 12: {38983: 5, 10232: 4, 27081: 4, 21063: 2, 11667: 1, 
                      17000: 4, 7346: 1, 26764: 3, 19550: 2, 19554:4},
                 13: {38983: 5, 10232: 4, 27081: 4, 21063: 2, 11667: 1, 
                      17000: 4, 7346: 1, 26764: 3, 19550: 2, 19554:4},
                 14: {38983: 5, 10232: 4, 27081: 4, 21063: 2, 11667: 1, 
                      17000: 4, 7346: 1, 26764: 3, 19550: 2, 19554:4}
                }

    def tearDown(self):
        """Do at end of every test."""

        del self.games
        del self.users

    def test_get_all_similarities(self):
        """Do we get the expected result?"""

        target_game = 38983
        user_id = 12
        # import pdb; pdb.set_trace()
        assert get_all_similarities(target_game, self.users, self.games, user_id) == {10: 1.0, 11: 1.0, 13: 1.0, 14: 1.0}

    def test_filt_all(self):

        user1 = 11 
        user2 = 12
        # import pdb; pdb.set_trace()

        assert filt_all(user1, user2, self.games, self.users) == [(1, 1, 38983), 
                                                        (4, 4, 10232), 
                                                        (1, 1, 27081), 
                                                        (4, 4, 21063), 
                                                        (2, 2, 11667), 
                                                        (4, 4, 17000), 
                                                        (2, 2, 7346), 
                                                        (3, 3, 26764), 
                                                        (4, 4, 19550), 
                                                        (5, 5, 19554)]

    def test_pearson(self):

        pairs = [(1, 4), (4, 2), (2, 4), (4, 1), (3, 3), (4, 2), (3, 2), (2, 4), 
                 (1, 5), (5, 4), (4, 2), (1, 3), (5, 1), (5, 4), (4, 5), (4, 2), 
                 (2, 1), (1, 1), (5, 2), (2, 4), (2, 1), (2, 2), (2, 4), (4, 3), 
                 (2, 1), (3, 5), (1, 3), (1, 2), (1, 4), (2, 1), (2, 5), (5, 1), 
                 (4, 1), (5, 2), (2, 5), (2, 3), (4, 2), (2, 5), (4, 5), (3, 3), 
                 (5, 5), (5, 2), (2, 3), (3, 4), (2, 3), (5, 5), (2, 1), (2, 4), 
                 (5, 4), (2, 2), (4, 3), (4, 2), (1, 4), (2, 5), (2, 4), (5, 4), 
                 (3, 5), (4, 4), (1, 3), (5, 1), (2, 1), (3, 2), (1, 4), (5, 1), 
                 (3, 1), (4, 3), (5, 5), (4, 4), (3, 2), (1, 2), (5, 2), (5, 4), 
                 (2, 5), (2, 5), (1, 4), (4, 4), (4, 3), (1, 1), (5, 2), (3, 3), 
                 (2, 3), (3, 3), (3, 2), (2, 4), (4, 5), (1, 3), (3, 3), (1, 4), 
                 (3, 5), (5, 1), (3, 3), (4, 4), (5, 4), (1, 1), (5, 2), (1, 3), 
                 (5, 1), (1, 4), (2, 1), (3, 5), (5, 3), (5, 5), (1, 4), (1, 1), 
                 (3, 4), (5, 3), (5, 2), (4, 4), (3, 3), (3, 3), (3, 2), (1, 4), 
                 (1, 1), (3, 3), (1, 4), (4, 1), (5, 2), (5, 5), (2, 4), (5, 2), 
                 (4, 4), (2, 1), (1, 1), (5, 5), (5, 4), (4, 2), (1, 2), (3, 5), 
                 (1, 5), (4, 3), (5, 3), (2, 3), (3, 4), (1, 5), (3, 1), (5, 2), 
                 (2, 3), (2, 4), (3, 2), (1, 3), (4, 5), (3, 2), (1, 3), (4, 3), 
                 (1, 3), (2, 5), (1, 3), (5, 2), (1, 4), (2, 1), (3, 3), (5, 1), 
                 (2, 2), (2, 2), (4, 3), (1, 3), (3, 1), (1, 4), (2, 5), (5, 4), 
                 (5, 5), (2, 3), (4, 5), (4, 5), (2, 5), (4, 2), (2, 3), (5, 4), 
                 (4, 5), (1, 2), (2, 3), (3, 3), (3, 4), (4, 3), (1, 2), (5, 4), 
                 (4, 1), (4, 3), (2, 3), (5, 3), (1, 3), (5, 1), (3, 5), (4, 3), 
                 (2, 4), (5, 1), (3, 4), (2, 5), (3, 3), (3, 2), (2, 3), (1, 5), 
                 (2, 2), (1, 4), (2, 1), (2, 4), (2, 4), (5, 2), (1, 3), (1, 4), 
                 (5, 4), (4, 5), (3, 4), (5, 3), (5, 2), (3, 3), (2, 5), (5, 2), 
                 (1, 5), (2, 1), (4, 1), (4, 3), (2, 4), (3, 3), (5, 2), (4, 3), 
                 (2, 2), (2, 5), (3, 4), (3, 1), (3, 4), (1, 5), (3, 5), (3, 2), 
                 (2, 3)]

        # import pdb; pdb.set_trace()

        assert pearson(pairs) == -0.09100648402162553

    def test_predict(self):

        sims = {10: 0.02383173173628074, 11: -0.06863014222129703, 
                12: -0.031168143681458316, 13: -0.0627253940114878, 
                14: 0.05444267283832687}

        target_game = 38983

        # import pdb; pdb.set_trace()

        assert predict(sims, self.users, target_game) == 2.30024962184833



if __name__ == "__main__":
    unittest.main()