from flask import Blueprint, render_template, make_response, request
from weasyprint import HTML
from app.models import Student, Level, Divisions
from sqlalchemy import asc

reports_bp = Blueprint('reports_bp', __name__)

@reports_bp.route('/report/full_roster')
def full_roster():
    students = Student.query.order_by(asc(Student.student_lname)).all()
    html = render_template('reports/report.html', students=students)
    pdf = HTML(string=html).write_pdf()
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename=full_roster.pdf'
    return response

@reports_bp.route('/report/level/<int:level_id>')
def level_roster(level_id):
    students = Student.query.filter_by(student_level_id=level_id).order_by(asc(Student.student_lname)).all()
    html = render_template('report.html', students=students)
    pdf = HTML(string=html).write_pdf()
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename=level_roster.pdf'
    return response

@reports_bp.route('/report/division/<int:division_id>')
def division_roster(division_id):
    students = Student.query.filter_by(student_division_id=division_id).order_by(asc(Student.student_lname)).all()
    html = render_template('report.html', students=students)
    pdf = HTML(string=html).write_pdf()
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename=division_roster.pdf'
    return response

@reports_bp.route('/report/age/<int:age>')
def age_roster(age):
    students = Student.query.filter_by(student_age=age).order_by(asc(Student.student_lname)).all()
    html = render_template('report.html', students=students)
    pdf = HTML(string=html).write_pdf()
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename=age_roster.pdf'
    return response

@reports_bp.route('/report/custom', methods=['GET', 'POST'])
def custom_roster():
    if request.method == 'POST':
        level_id = request.form.get('level')
        division_id = request.form.get('division')
        age = request.form.get('age')

        students = Student.query.filter_by(student_level_id=level_id, student_division_id=division_id, student_age=age).order_by(asc(Student.student_lname)).all()
        html = render_template('report.html', students=students)
        pdf = HTML(string=html).write_pdf()
        response = make_response(pdf)
        response.headers['Content-Type'] = 'application/pdf'
        response.headers['Content-Disposition'] = 'inline; filename=custom_roster.pdf'
        return response
    else:
        levels = Level.query.all()
        divisions = Divisions.query.all()
        return render_template('choose_report.html', levels=levels, divisions=divisions)