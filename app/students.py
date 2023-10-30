from flask import Blueprint, render_template
from app.models import Student  # Import the Student model

students_bp = Blueprint('students', __name__)

# Define your student-related routes and views here
@students_bp.route('/students', methods=['GET'])
def list_students():
    students = Student.query.all()
    return render_template('students/list_students.html', students=students)

# Add more student-related routes as needed
