from flask import Blueprint, render_template, request
from app.models import Student
from sqlalchemy import or_

students_bp = Blueprint('students', __name__)

@students_bp.route('/students', methods=['GET'])
def list_students():
    page = request.args.get('page', 1, type=int)
    per_page = 20  # Number of students per page

    search_query = request.args.get('search', '')
    sort_by = request.args.get('sort', 'student_id')

    students = Student.query.filter(
        or_(
            Student.student_fname.ilike(f'%{search_query}%'),
            Student.student_lname.ilike(f'%{search_query}%')
        )
    ).order_by(sort_by).paginate(page=page, per_page=per_page)

    return render_template('students/list_students.html', students=students, search_query=search_query, sort_by=sort_by)
