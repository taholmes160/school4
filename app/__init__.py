from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_wtf.csrf import CSRFProtect
from flask_bootstrap import Bootstrap

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://server2:T3t0npack@localhost/school4'  # Replace with your MariaDB connection details
db = SQLAlchemy(app)
csrf = CSRFProtect(app)
bootstrap = Bootstrap(app)

from app.students import students_bp  # Import the students blueprint

app.register_blueprint(students_bp, url_prefix='/students')

from app import routes

