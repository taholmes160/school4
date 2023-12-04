from flask import Blueprint, render_template, request, flash, redirect, url_for, jsonify
from app.models import Student, Level, Gender, State, Campus, Nationality, Ethnicity, Suffix, Divisions, Comment, Dorm, DormRoom
from app import db
from datetime import datetime

students_bp = Blueprint('students', __name__)

@students_bp.route('/students', methods=['GET'])
def list_students():
    page = request.args.get('page', 1, type=int)
    per_page = 15  # Number of students per page

    search_query = request.args.get('search', '')
    sort_by = request.args.get('sort', 'student_id')
    level_filter = request.args.get('level_filter', '')

    # Query the levels
    levels = Level.query.all()

    query = Student.query

    if level_filter:
        query = query.filter(Student.level.has(Level.level_name == level_filter))

    if sort_by == 'gender.gender_name':
        students = query.join(Student.gender).order_by(Gender.gender_name).paginate(page=page, per_page=per_page)
    elif sort_by == 'level.level_name':
        students = query.join(Student.level).order_by(Level.level_name).paginate(page=page, per_page=per_page)
    else:
        students = query.order_by(sort_by).paginate(page=page, per_page=per_page)

    # Pass the levels to the template
    return render_template('students/list_students.html', students=students, search_query=search_query, sort_by=sort_by, levels=levels)


@students_bp.route('/students/<int:student_id>/edit', methods=['GET', 'POST'])
def edit_student(student_id):
    student = Student.query.get_or_404(student_id)
    student_comments = Comment.query.filter_by(student_id=student_id).order_by(Comment.comment_date.desc()).all()

    if request.method == 'POST':
        if 'submit_student' in request.form:
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
            return redirect(url_for('students.edit_student', student_id=student_id))
        return
    elif 'submit_comment' in request.form:
        comment_text = request.form.get('comment_text')
        comment_by = request.form.get('comment_by')
        comment_date = request.form.get('comment_date') or datetime.now().date()
        comment_level = request.form.get('comment_level')

        comment = Comment(
            student_id=student_id,
            comment_text=comment_text,
            comment_by=comment_by,
            comment_date=comment_date,
            comment_level=comment_level
        )
        db.session.add(comment)
        db.session.commit()
        flash('Comment added successfully', 'success')
        return redirect(url_for('students.edit_student', student_id=student_id))

    genders = Gender.query.all()
    levels = Level.query.all()
    divisions = Divisions.query.all()
    suffixes = Suffix.query.all()
    states = State.query.all()
    campus = Campus.query.all()
    nationality = Nationality.query.all()
    ethnicity = Ethnicity.query.all()
    dorms = Dorm.query.all()
    rooms = DormRoom.query.all()

      # If the student has been assigned a dorm, fetch the rooms in that dorm
    if student.dorm_id is not None:
        rooms = DormRoom.query.filter_by(dorm_id=student.dorm_id).all()
    else:
        rooms = []

    return render_template('students/edit_student.html', student=student, student_comments=student_comments, today=datetime.now().date(), genders=genders, levels=levels, divisions=divisions, suffixes=suffixes, states=states, campus=campus, nationality=nationality, ethnicity=ethnicity, dorms=dorms, rooms=rooms)

@students_bp.route('/students/<int:student_id>/comments/add', methods=['POST'])
def add_comment(student_id):
    student = Student.query.get_or_404(student_id)

    comment_text = request.form.get('comment_text')
    comment_date = datetime.now().date()
    comment_level = 'Student'  # You can adjust this based on your requirements

    new_comment = Comment(
        student_id=student_id,
        comment_text=comment_text,
        comment_date=comment_date,
        comment_level=comment_level
    )
    db.session.add(new_comment)
    db.session.commit()

    flash('Comment added successfully', 'success')
    return redirect(url_for('students.edit_student', student_id=student_id))
    

@students_bp.route('/students/create', methods=['GET', 'POST'])
def create_student():
    if request.method == 'POST':
        student_fname = request.form.get('fname')
        student_mname = request.form.get('mname')
        student_lname = request.form.get('lname')
        student_suffix_id = request.form.get('suffix_id')
        student_goesby = request.form.get('goesby')
        student_gender_id = request.form.get('gender_id')
        student_level_id = request.form.get('level_id')
        student_division_id = request.form.get('division_id')
        student_age = request.form.get('age')
        student_birthday = request.form.get('birthday')
        student_address = request.form.get('address')
        student_address2 = request.form.get('address2')
        student_city = request.form.get('city')
        student_state_id = request.form.get('state_id')
        student_zip = request.form.get('zip')
        student_district = request.form.get('district')
        student_status = request.form.get('status')
        student_enrolled = request.form.get('enrolled')
        student_campus_id = request.form.get('campus_id')
        student_nationality_id = request.form.get('nationality_id')
        student_ethnicity_id = request.form.get('ethnicity_id')

        new_student = Student(
            student_fname=student_fname,
            student_mname=student_mname,
            student_lname=student_lname,
            student_suffix_id=student_suffix_id,
            student_goesby=student_goesby,
            student_gender_id=student_gender_id,
            student_level_id=student_level_id,
            student_division_id=student_division_id,
            student_age=student_age,
            student_birthday=student_birthday,
            student_address=student_address,
            student_address2=student_address2,
            student_city=student_city,
            student_state_id=student_state_id,
            student_zip=student_zip,
            student_district=student_district,
            student_status=student_status,
            student_enrolled=student_enrolled,
            student_campus_id=student_campus_id,
            student_nationality_id=student_nationality_id,
            student_ethnicity_id=student_ethnicity_id
        )

        db.session.add(new_student)
        db.session.commit()

        flash('Student created successfully', 'success')
        return redirect(url_for('students.list_students'))

    genders = Gender.query.all()
    levels = Level.query.all()
    divisions = Divisions.query.all()
    suffixes = Suffix.query.all()
    states = State.query.all()
    campus = Campus.query.all()
    nationality = Nationality.query.all()
    ethnicity = Ethnicity.query.all()
    
    return render_template('students/create_student.html', genders=genders, levels=levels, divisions=divisions, suffixes=suffixes, states=states, campus=campus, nationality=nationality, ethnicity=ethnicity)

@students_bp.route('/students/<int:student_id>/assign_dorm', methods=['POST'])
def assign_dorm(student_id):
    student = Student.query.get_or_404(student_id)
    dorm_id = request.form.get('dorm_id')

    student.dorm_id = dorm_id
    db.session.commit()

    flash('Student assigned to dorm successfully', 'success')
    return redirect(url_for('students.edit_student', student_id=student_id))


@students_bp.route('/students/<int:student_id>/assign_room', methods=['POST'])
def assign_room(student_id):
    student = Student.query.get_or_404(student_id)
    room_id = request.form.get('room_id')

    student.room_id = room_id
    db.session.commit()

    flash('Student assigned to room successfully', 'success')
    return redirect(url_for('students.edit_student', student_id=student_id))

@students_bp.route('/get_rooms/<int:dorm_id>')
def get_rooms(dorm_id):
    rooms = DormRoom.query.filter_by(dorm_id=dorm_id).all()
    rooms_list = [{'id': room.id, 'name': room.room_number} for room in rooms]  # Use room.room_number here
    print(rooms_list)  # Debugging: print the rooms list to the console
    return jsonify(rooms_list)


