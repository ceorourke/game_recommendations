"""Seeds system data into db"""

from sqlalchemy import func
from model import System
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

#*****************************************************************************#


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    load_systems()