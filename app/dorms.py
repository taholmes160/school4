from flask import Blueprint, render_template, request, flash, redirect, url_for
from app.models import Dorm, DormRoom, DormManager
from app import db

dorms_bp = Blueprint('dorms', __name__)

@dorms_bp.route('/dorms', methods=['GET'])
def list_dorms():
    dorms = Dorm.query.all()
    return render_template('dorms/list_dorms.html', dorms=dorms)

@dorms_bp.route('/dorms/<int:dorm_id>', methods=['GET'])
def view_dorm(dorm_id):
    dorm = Dorm.query.get_or_404(dorm_id)
    return render_template('dorms/view_dorm.html', dorm=dorm)


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

# Add more routes and functions as needed
