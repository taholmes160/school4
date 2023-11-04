from flask import Blueprint, render_template, request, flash, redirect, url_for
from app.models import Dorm, DormRoom, DormManager
from app import db

dorms_bp = Blueprint('dorms', __name__)

@dorms_bp.route('/dorm_managers', methods=['GET', 'POST'])
def dorm_managers():
    if request.method == 'POST':
        dm_name = request.form.get('dm_name')
        dm_phone = request.form.get('dm_phone')

        # Create a new DormManager object
        dorm_manager = DormManager(dm_name=dm_name, dm_phone=dm_phone)

        # Add the dorm_manager to the database
        db.session.add(dorm_manager)
        db.session.commit()

        flash('Dorm Manager added successfully', 'success')
        return redirect(url_for('dorms.dorm_managers'))

    dorm_managers = DormManager.query.all()
    return render_template('dorms/dorm_managers.html', dorm_managers=dorm_managers)

@dorms_bp.route('/dorms', methods=['GET', 'POST'])
def dorms():
    if request.method == 'POST':
        dorm_name = request.form.get('dorm_name')
        dorm_phone = request.form.get('dorm_phone')
        dorm_capacity = request.form.get('dorm_capacity')
        dm_id = request.form.get('dm_id')

        # Create a new Dorm object
        dorm = Dorm(dorm_name=dorm_name, dorm_phone=dorm_phone, dorm_capacity=dorm_capacity, dm_id=dm_id)

        # Add the dorm to the database
        db.session.add(dorm)
        db.session.commit()

        flash('Dorm added successfully', 'success')
        return redirect(url_for('dorms.dorms'))

    dorms = Dorm.query.all()
    dorm_managers = DormManager.query.all()
    return render_template('dorms/dorms.html', dorms=dorms, dorm_managers=dorm_managers)

@dorms_bp.route('/dorm_rooms', methods=['GET'])
def list_dorm_rooms():
    page = request.args.get('page', 1, type=int)
    per_page = 20  # Number of dorm rooms per page

    dorm_rooms = DormRoom.query.paginate(page=page, per_page=per_page)
    return render_template('dorms/list_dorm_rooms.html', dorm_rooms=dorm_rooms)


@dorms_bp.route('/dorm_rooms/<int:droom_id>/edit', methods=['GET', 'POST'])
def edit_dorm_room(droom_id):
    dorm_room = DormRoom.query.get_or_404(droom_id)

    if request.method == 'POST':
        dorm_room.droom_number = request.form.get('droom_number')
        dorm_room.droom_capacity = request.form.get('droom_capacity')
        dorm_room.droom_notes = request.form.get('droom_notes')
        dorm_room.droom_phone = request.form.get('droom_phone')
        dorm_room.droom_floor = request.form.get('droom_floor')
        dorm_room.droom_unit = request.form.get('droom_unit')

        db.session.commit()
        flash('Dorm room details updated successfully', 'success')
        return redirect(url_for('dorms.list_dorm_rooms'))

    return render_template('dorms/edit_dorm_room.html', dorm_room=dorm_room)


@dorms_bp.route('/dorm_rooms/create', methods=['GET', 'POST'])
def create_dorm_room():
    if request.method == 'POST':
        droom_number = request.form.get('droom_number')
        droom_capacity = request.form.get('droom_capacity')
        droom_notes = request.form.get('droom_notes')
        droom_phone = request.form.get('droom_phone')
        droom_floor = request.form.get('droom_floor')
        droom_unit = request.form.get('droom_unit')

        dorm_room = DormRoom(droom_number=droom_number, droom_capacity=droom_capacity, droom_notes=droom_notes,
                             droom_phone=droom_phone, droom_floor=droom_floor, droom_unit=droom_unit)

        db.session.add(dorm_room)
        db.session.commit()

        flash('Dorm room created successfully', 'success')
        return redirect(url_for('dorms.list_dorm_rooms'))

    return render_template('dorms/create_dorm_room.html')


# Add more routes and functions as needed
