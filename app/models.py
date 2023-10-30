from app import db

class Student(db.Model):
    student_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_fname = db.Column(db.String(45), nullable=True)
    student_mname = db.Column(db.String(45), nullable=True)
    student_lname = db.Column(db.String(45), nullable=True)
    student_suffix_id = db.Column(db.Integer, nullable=True)
    student_goesby = db.Column(db.String(45), nullable=True)
    student_gender_id = db.Column(db.Integer, nullable=True)
    student_level_id = db.Column(db.Integer, nullable=True)
    student_division = db.Column(db.String(45), nullable=True)
    student_age = db.Column(db.String(45), nullable=True)
    student_birthday = db.Column(db.Date, nullable=True)
    student_address = db.Column(db.String(45), nullable=True)
    student_address2 = db.Column(db.String(45), nullable=True)
    student_city = db.Column(db.String(45), nullable=True)
    student_state_id = db.Column(db.Integer, nullable=True)
    student_zip = db.Column(db.String(45), nullable=True)
    student_district = db.Column(db.String(45), nullable=True)
    student_status = db.Column(db.String(45), nullable=True)
    student_enrolled = db.Column(db.String(45), nullable=True)
    student_campus_id = db.Column(db.Integer, nullable=True)
    student_nationality_id = db.Column(db.Integer, nullable=True)
    student_ethnicity_id = db.Column(db.Integer, nullable=True)

    # Define any additional relationships, methods, or constraints for the Student model here
