from app import db

class Gender(db.Model):
    __tablename__ = 'tbl_gender'
    gender_id = db.Column(db.Integer, primary_key=True)
    gender_name = db.Column(db.String(45), nullable=False)
    
class Level(db.Model):
    __tablename__ = 'tbl_levels'
    level_id = db.Column(db.Integer, primary_key=True)
    level_name = db.Column(db.String(45), nullable=False)
    level_abbrev = db.Column(db.String(45), nullable=False)

class Campus(db.Model):
    __tablename__ = 'tbl_campus'
    campus_id = db.Column(db.Integer, primary_key=True)
    campus_name = db.Column(db.String(45), nullable=False)
    # Add other fields for the campus table
    
class Status(db.Model):
    __tablename__ = 'tbl_status'
    student_status_id = db.Column(db.Integer, primary_key=True)
    student_status = db.Column(db.String(45), nullable=False)
    # Add other fields for the campus table

class State(db.Model):
    __tablename__ = 'tbl_state'
    state_id = db.Column(db.Integer, primary_key=True)
    state_name = db.Column(db.String(45), nullable=False)
    # Add other fields for the state table

class Nationality(db.Model):
    __tablename__ = 'tbl_nationality'
    nationality_id = db.Column(db.Integer, primary_key=True)
    nationality_name = db.Column(db.String(45), nullable=False)
    # Add other fields for the nationality table

class Ethnicity(db.Model):
    __tablename__ = 'tbl_ethnicity'
    ethnicity_id = db.Column(db.Integer, primary_key=True)
    ethnicity_name = db.Column(db.String(45), nullable=False)
    # Add other fields for the ethnicity table

class Suffix(db.Model):
    __tablename__ = 'tbl_suffix'
    suffix_id = db.Column(db.Integer, primary_key=True)
    suffix = db.Column(db.String(45), nullable=False)
    
class Divisions(db.Model):
    __tablename__='tbl_divisions'
    division_id = db.Column(db.Integer, primary_key=True)
    division_name = db.Column(db.String(45), nullable=False)
    
class Prefix(db.Model):
    __tablename__ = 'tbl_prefix'
    prefix_id = db.Column(db.Integer, primary_key=True)
    prefix_name = db.Column(db.String(45), nullable=False)
    
class Student(db.Model):
    __tablename__ = 'tbl_student'
    student_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_fname = db.Column(db.String(45), nullable=True)
    student_mname = db.Column(db.String(45), nullable=True)
    student_lname = db.Column(db.String(45), nullable=True)
    student_suffix_id = db.Column(db.Integer, nullable=True)
    student_goesby = db.Column(db.String(45), nullable=True)
    student_gender_id = db.Column(db.Integer, db.ForeignKey('tbl_gender.gender_id'), nullable=True)
    student_level_id = db.Column(db.Integer, db.ForeignKey('tbl_levels.level_id'), nullable=True)
    student_division = db.Column(db.String(45), nullable=True)
    student_age = db.Column(db.String(45), nullable=True)
    student_birthday = db.Column(db.Date, nullable=True)
    student_address = db.Column(db.String(45), nullable=True)
    student_address2 = db.Column(db.String(45), nullable=True)
    student_city = db.Column(db.String(45), nullable=True)
    student_state_id = db.Column(db.Integer, db.ForeignKey('tbl_state.state_id'), nullable=True)
    student_zip = db.Column(db.String(45), nullable=True)
    student_district = db.Column(db.String(45), nullable=True)
    student_status = db.Column(db.String(45), nullable=True)
    student_enrolled = db.Column(db.String(45), nullable=True)
    student_campus_id = db.Column(db.Integer, db.ForeignKey('tbl_campus.campus_id'), nullable=True)
    student_nationality_id = db.Column(db.Integer, db.ForeignKey('tbl_nationality.nationality_id'), nullable=True)
    student_ethnicity_id = db.Column(db.Integer, db.ForeignKey('tbl_ethnicity.ethnicity_id'), nullable=True)

    gender = db.relationship('Gender', backref='students')
    level = db.relationship('Level', backref='students')
    campus = db.relationship('Campus', backref='students')
    state = db.relationship('State', backref='students')
    nationality = db.relationship('Nationality', backref='students')
    ethnicity = db.relationship('Ethnicity', backref='students')
