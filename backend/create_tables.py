from api import db, app

# Drop all tables, create all tables, and commit the tables
print("Creating Sample Tables")
db.drop_all()
db.create_all()
db.session.commit()
print("Done Creating Sample Tables")