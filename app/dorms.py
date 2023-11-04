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

# Add more routes and functions as needed
