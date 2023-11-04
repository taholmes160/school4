from dotenv import load_dotenv
load_dotenv()
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_wtf.csrf import CSRFProtect
from flask_bootstrap import Bootstrap
import os


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('SQLALCHEMY_DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY')

db = SQLAlchemy(app)
csrf = CSRFProtect(app)
bootstrap = Bootstrap(app)

from app.students import students_bp  # Import the students blueprint
app.register_blueprint(students_bp, url_prefix='/students')

from app.dorms import dorms_bp
app.register_blueprint(dorms_bp, url_prefix='/dorms')
from app import routes