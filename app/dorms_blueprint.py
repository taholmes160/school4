# dorms_blueprint.py
from flask import Blueprint, render_template, request, flash, redirect, url_for
from app.models import db, DormManager, Dorm, DormRoom, Student
from flask_wtf import FlaskForm

 

dorms_bp = Blueprint('dorms', __name__, template_folder='templates/dorms')

@dorms_bp.route('/managers', methods=['GET'])
def list_dorm_managers():
    dorm_managers = DormManager.query.all()
    return render_template('dorm_managers_list.html', dorm_managers=dorm_managers)

@dorms_bp.route('/managers/add', methods=['GET', 'POST'])
def add_dorm_manager():
    if request.method == 'POST':
        manager_name = request.form.get('manager_name')  # Assuming the form field name is 'manager_name'
        new_manager = DormManager(manager_name=manager_name)
        db.session.add(new_manager)
        db.session.commit()
        return redirect(url_for('dorms.list_dorm_managers'))  # Redirect to the list of managers
    return render_template('add_dorm_manager.html')

@dorms_bp.route('/managers/<int:manager_id>/edit', methods=['GET', 'POST'])
def edit_dorm_manager(manager_id):
    manager = DormManager.query.get_or_404(manager_id)
    if request.method == 'POST':
        manager_name = request.form.get('manager_name')  # Assuming the form field name is 'manager_name'
        manager.manager_name = manager_name
        db.session.commit()
        return redirect(url_for('dorms.list_dorm_managers'))  # Redirect to the list of managers
    return render_template('edit_dorm_manager.html', manager=manager)

@dorms_bp.route('/managers/<int:manager_id>/delete', methods=['POST'])
def delete_dorm_manager(manager_id):
    manager = DormManager.query.get_or_404(manager_id)
    db.session.delete(manager)
    db.session.commit()
    return redirect(url_for('dorms.list_dorm_managers'))  # Redirect to the list of managers

@dorms_bp.route('/dorms/add', methods=['GET', 'POST'])
def add_dorm():
    if request.method == 'POST':
        dorm_name = request.form.get('dorm_name')
        address = request.form.get('address')
        city = request.form.get('city')
        state = request.form.get('state')
        zip_code = request.form.get('zip_code')
        phone_number = request.form.get('phone_number')
        num_rooms = int (request.form.get('num_rooms'))
        manager_id = int (request.form.get('manager_id'))  # Assuming manager_id comes from a dropdown/select box

        new_dorm = Dorm(
            dorm_name=dorm_name,
            address=address,
            city=city,
            state=state,
            zip_code=zip_code,
            phone_number=phone_number,
            num_rooms=num_rooms,
            manager_id=manager_id
        )
        db.session.add(new_dorm)
        db.session.commit()
        return redirect(url_for('dorms.list_dorms'))
    
    # Fetch DormManager data for dropdown/select box
    dorm_managers = DormManager.query.all()
    return render_template('add_dorm.html', dorm_managers=dorm_managers)

@dorms_bp.route('/dorms', methods=['GET'])
def list_dorms():
    dorms = Dorm.query.all()
    return render_template('list_dorms.html', dorms=dorms)

@dorms_bp.route('/dorms/<int:dorm_id>/edit', methods=['GET', 'POST'])
def edit_dorm(dorm_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    if request.method == 'POST':
        # Update dorm information
        dorm.dorm_name = request.form.get('dorm_name')
        dorm.address = request.form.get('address')
        # Update other dorm fields similarly
        
        db.session.commit()
        flash('Dorm updated successfully', 'success')
        return redirect(url_for('dorms.list_dorms'))
    
    return render_template('edit_dorm.html', dorm=dorm)

@dorms_bp.route('/dorms/<int:dorm_id>/delete', methods=['POST'])
def delete_dorm(dorm_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    db.session.delete(dorm)
    db.session.commit()
    flash('Dorm deleted successfully', 'success')
    return redirect(url_for('dorms.list_dorms'))

@dorms_bp.route('/dorms/<int:dorm_id>/rooms/new', methods=['GET', 'POST'])
def new_dorm_room(dorm_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    if request.method == 'POST':
        room_number = request.form['room_number']
        capacity = request.form['capacity']
        room = DormRoom(room_number=room_number, capacity=capacity, dorm_id=dorm_id)
        db.session.add(room)
        db.session.commit()
        flash('Dorm room created successfully.')
        return redirect(url_for('dorms.list_dorm_rooms', dorm_id=dorm_id))
    return render_template('dorms/new_dorm_room.html', dorm=dorm)

@dorms_bp.route('/dorms/<int:dorm_id>/rooms/<int:room_id>/edit', methods=['GET', 'POST'])
def edit_dorm_room(dorm_id, room_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    room = DormRoom.query.get_or_404(room_id)
    if request.method == 'POST':
        room.room_number = request.form['room_number']
        room.capacity = request.form['capacity']
        db.session.commit()
        flash('Dorm room updated successfully.')
        return redirect(url_for('dorms.list_dorm_rooms', dorm_id=dorm_id))
    return render_template('dorms/edit_dorm_rooms.html', dorm=dorm, room=room)

@dorms_bp.route('/dorms/<int:dorm_id>/rooms/<int:room_id>/delete', methods=['POST'])
def delete_dorm_room(dorm_id, room_id):
    dorm= Dorm.query.get_or_404(dorm_id)
    room = DormRoom.query.get_or_404(room_id)
    db.session.delete(room)
    db.session.commit()
    flash('Dorm room deleted successfully.')
    return redirect(url_for('list_dorm_rooms', dorm_id=dorm_id))

@dorms_bp.route('/dorms/<int:dorm_id>/rooms', methods=['GET'])
def list_dorm_rooms(dorm_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    rooms = DormRoom.query.filter_by(dorm_id=dorm_id).options(db.joinedload(DormRoom.students)).all()
    return render_template('list_dorm_rooms.html', dorm=dorm, rooms=rooms)
    
@dorms_bp.route('/assign_room', methods=['GET', 'POST'])
def assign_room():
    form = FlaskForm()  # Create an instance of FlaskForm to generate a CSRF token
    dorm_id = request.args.get('dorm_id', None)
    room_id = request.args.get('room_id', None)
    dorm = Dorm.query.get(dorm_id) if dorm_id else None  # Query the dorm
    room = DormRoom.query.get(room_id) if room_id else None  # Query the room
    students = Student.query.all()  # Query all students
    dorms = Dorm.query.all()  # Query all dorms

    if request.method == 'POST':
        student_ids = request.form.getlist('student')  # Get list of student ids

        if len(student_ids) > room.capacity:
            flash('Cannot assign more students than room capacity.')
            return redirect(url_for('assign_room'))

        for student_id in student_ids:
            student = Student.query.get(student_id)
            if room.dorm.gender != student.gender:
                flash('Cannot assign a student to a room in a dorm of the wrong gender.')
                return redirect(url_for('dorms.assign_room'))
        
            if student.room:
                student.room.current_capacity -= 1
                db.session.add(student.room)  # Add the room to the session
        
            student.room = room
            room.current_capacity += 1
            db.session.add(room)  # Add the room to the session
            db.session.add(student)  # Add the student to the session
        
        db.session.commit()
        

        flash('Successfully assigned students to room.')
        return redirect(url_for('dorms.list_dorm_rooms', dorm_id=dorm_id))

    return render_template('assign_room.html', form=form, students=students, dorms=dorms, dorm_id=dorm_id, room_id=room_id, room=room, dorm=dorm)  # Pass the dorm to the template
