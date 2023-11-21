# dorms_blueprint.py

from flask import render_template, request, redirect, url_for
from app.models import DormManager, db
from app.dorms_blueprint import dorms_bp

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
