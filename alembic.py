from flask import Flask
from flask_alembic import Alembic

app = Flask(__name__)
alembic = Alembic(app)
