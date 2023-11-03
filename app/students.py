from flask import Blueprint, render_template, request, flash, redirect, url_for
from app.models import Student, Level, Gender, State, Campus, Nationality, Ethnicity, Status, Suffix, Divisions
from sqlalchemy import or_
from app import db

students_bp = Blueprint('students', __name__)

@students_bp.route('/students', methods=['GET'])
def list_students():
    page = request.args.get('page', 1, type=int)
    per_page = 18  # Number of students per page

    search_query = request.args.get('search', '')
    sort_by = request.args.get('sort', 'student_id')

    if sort_by == 'gender.gender_name':
        students = Student.query.join(Student.gender).order_by(Gender.gender_name).paginate(page=page, per_page=per_page)
    elif sort_by == 'level.level_name':
        students = Student.query.join(Student.level).order_by(Level.level_name).paginate(page=page, per_page=per_page)
    else:
        students = Student.query.order_by(sort_by).paginate(page=page, per_page=per_page)
    return render_template('students/list_students.html', students=students, search_query=search_query, sort_by=sort_by)

@students_bp.route('/students/<int:student_id>/edit', methods=['GET', 'POST'])
def edit_student(student_id):
    student = Student.query.get_or_404(student_id)

    if request.method == 'POST':
        student.student_fname = request.form.get('fname')
        student.student_mname = request.form.get('mname')
        student.student_lname = request.form.get('lname')
        student.student_suffix_id = request.form.get('suffix_id')
        student.student_goesby = request.form.get('goesby')
        student.student_gender_id = request.form.get('gender_id')
        student.student_level_id = request.form.get('level_id')
        student.student_division_id = request.form.get('division_id')
        student.student_age = request.form.get('age')
        student.student_birthday = request.form.get('birthday')
        student.student_address = request.form.get('address')
        student.student_address2 = request.form.get('address2')
        student.student_city = request.form.get('city')
        student.student_state_id = request.form.get('state_id')
        student.student_zip = request.form.get('zip')
        student.student_district = request.form.get('district')
        student.student_status = request.form.get('status')
        student.student_enrolled = request.form.get('enrolled')
        student.student_campus_id = request.form.get('campus_id')
        student.student_nationality_id = request.form.get('nationality_id')
        student.student_ethnicity_id = request.form.get('ethnicity_id')

        db.session.commit()
        flash('Student details updated successfully', 'success')
        return redirect(url_for('students.list_students'))

    genders = Gender.query.all()
    levels = Level.query.all()
    campus = Campus.query.all()
    states = State.query.all()
    nationality = Nationality.query.all()
    ethnicity = Ethnicity.query.all()
    statuses = Status.query.all()
    suffix=Suffix.query.all()
    divisions=Divisions.query.all()
    return render_template('students/edit_student.html', suffix=suffix, divisions=divisions, student=student, statuses=statuses, genders=genders, levels=levels, campus=campus, states=states, nationality=nationality, ethnicity=ethnicity)