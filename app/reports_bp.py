# reports_bp.py

from flask import Blueprint, render_template, request, make_response
from app.models import Student, Level, Divisions
from app import db
from flask_weasyprint import HTML, render_pdf

reports_bp = Blueprint('reports', __name__)

@reports_bp.route('/reports', methods=['GET', 'POST'])
def generate_report():
    if request.method == 'POST':
        report_type = request.form.get('report_type')
        level_id = request.form.get('level_id')
        division_id = request.form.get('division_id')
        age = request.form.get('age')

        query = Student.query

        if report_type == 'level' and level_id:
            query = query.filter(Student.student_level_id == level_id)
        elif report_type == 'division' and division_id:
            query = query.filter(Student.student_division_id == division_id)
        elif report_type == 'age' and age:
            query = query.filter(Student.student_age == age)

        students = query.all()

        # Render the appropriate template based on the report type
        html = render_template('reports/report_template.html', students=students)

        # Check if the user wants a PDF or HTML
        if request.form.get('output_type') == 'pdf':
            return render_pdf(HTML(string=html))
        else:
            response = make_response(html)
            response.headers['Content-Type'] = 'text/html'
            return response

    levels = Level.query.all()
    divisions = Divisions.query.all()

    return render_template('reports/generate_report.html', levels=levels, divisions=divisions)

# Add the reports Blueprint to your app
# app.register_blueprint(reports_bp, url_prefix='/reports')
