from flask import render_template
from app import app

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/menu')
def menu():
    # You can render the 'menu.html' template here or perform any other logic.
    return render_template('menu.html')