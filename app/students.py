from flask import Blueprint, render_template, request
from app.models import Student

students_bp = Blueprint('students', __name__)

@students_bp.route('/students', methods=['GET'])
def list_students():
    page = request.args.get('page', 1, type=int)
    per_page = 25  # Number of students per page

    students = Student.query.paginate(page=page, per_page=per_page)

    return render_template('students/list_students.html', students=students)
