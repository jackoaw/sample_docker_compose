from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS, cross_origin
import os

# Get the database URL from the environment variables on the system
DB_URL = os.getenv('DATABASE_URL')

app = Flask(__name__)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = DB_URL
db = SQLAlchemy(app)

#  Setup a basic table for users of this app
class User(db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(128), unique=True, nullable=False)
    name = db.Column(db.String(128), unique=True, nullable=False)

    def __init__(self, email, name):
        self.email = email
        self.name = name


# Base directory for this api is <hostname>/api, just return hello world in json format for this demo
@app.route('/api')
@cross_origin()
def example():
    return {'hello': 'world'}

# If running just this file host it like this
if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')

