from dotenv import load_dotenv
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
import os

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('SQLALCHEMY_DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY')

db = SQLAlchemy(app)
migrate = Migrate(app, db)
csrf = CSRFProtect(app)

# Import the blueprints
from app.students import students_bp
from app.dorms_blueprint import dorms_bp
# Import the reports blueprint (make sure to create this file)
from app.reports import reports_bp

# Register the blueprints with the application
app.register_blueprint(students_bp, url_prefix='/students')
app.register_blueprint(dorms_bp, url_prefix='/dorms')
# Register the reports blueprint with a URL prefix
app.register_blueprint(reports_bp, url_prefix='/reports')

# Import any other routes (if you have a routes.py file)
from app import routes
