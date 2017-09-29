# Game Recs!

Learn more about the developer: https://www.linkedin.com/in/colleenelena/

This app provides video game recommendations to users who aren't sure what to play next. The user can make an account, rate games they like and don't like, and get a recommendation based on which platform they want to play on, and which genre of game they're looking to play.

![Homepage](/static/img/homepage.png)

# Features
  - Search for video games and rate them from 1-5
  ![Game Details](/static/img/gamedetails.png)
  - Get personalized game recommendations
  ![Recommendations](/static/img/recommendation.png)
  - User profile shows chart.JS data visualization of genre interests
  ![User Profile](/static/img/userprofile.png)

# Recommendations
The recommendations utilize the Pearson algorithm. The similarity between users is calculated using a weighted average. Users who are more strongly correlated (negatively and positively) are given a higher weight, as they have more predictive power. i.e. if user A and user B have a strong positive correlation, user B's 5 star rating on a game is a good indicator that user a will also rate it at 5. Similarly, if user A and user C have a strong negative correlation, user C's 1 star rating on a game is a good indicator that user A will rate that game a 5.

# Tech Stack
SQLAlchemy, PostgreSQL, Flask, Python, Javascript(Chart.js, JQuery, json, AJAX), Bootstrap, HTML/CSS

Libraries used: IGDB API, schedule, unittest, Jinja

### Installation

Game Recs has not yet been deployed, so here is how to run it locally on your machine. 

This requires Python 2 and Linux (I set up a virtual machine with Vagrant) to run.


Create a secrets.sh file with a variable named FLASK_SECRET_KEY with a value. For the purposes of just checking it out, this can be any string.
Then:
```sh
$ cd dir_of_your_choice
$ virtualenv env
$ pip install -r requirements.txt
$ createdb games
$ python seed.py
$ source secrets.sh
$ python server.py
```
Then navigate to:
```sh
http://localhost:5000/
```
The seed.py file loads in games that were recent when I first queried the API. For a potentially more updated list of games with new games that have come out since, you will need to obtain a free API key: https://www.igdb.com/api
Add a variable named IGDB_KEY (get this from the API) to secrets.sh and re-source it. Then you can run the following: 
```sh
$ python updatedb.py
```
and restart the server.