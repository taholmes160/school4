from app import db
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

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
    # Add other fields for the status table

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
    student_suffix_id = db.Column(db.Integer, db.ForeignKey('tbl_suffix.suffix_id'), nullable=True)
    student_goesby = db.Column(db.String(45), nullable=True)
    student_gender_id = db.Column(db.Integer, db.ForeignKey('tbl_gender.gender_id'), nullable=True)
    student_level_id = db.Column(db.Integer, db.ForeignKey('tbl_levels.level_id'), nullable=True)
    student_division_id = db.Column(db.Integer, db.ForeignKey('tbl_divisions.division_id'), nullable=True)
    student_age = db.Column(db.String(45), nullable=True)
    student_birthday = db.Column(db.Date, nullable=True)
    student_address = db.Column(db.String(45), nullable=True)
    student_address2 = db.Column(db.String(45), nullable=True)
    student_city = db.Column(db.String(45), nullable=True)
    student_state_id = db.Column(db.Integer, db.ForeignKey('tbl_state.state_id'), nullable=True)
    student_zip = db.Column(db.String(45), nullable=True)
    student_district = db.Column(db.String(45), nullable=True)
    student_status = db.Column(db.String(45), nullable=True)
    student_enrolled = db.Column(db.Date, nullable=True)
    student_campus_id = db.Column(db.Integer, db.ForeignKey('tbl_campus.campus_id'), nullable=True)
    student_nationality_id = db.Column(db.Integer, db.ForeignKey('tbl_nationality.nationality_id'), nullable=True)
    student_ethnicity_id = db.Column(db.Integer, db.ForeignKey('tbl_ethnicity.ethnicity_id'), nullable=True)
    

    gender = db.relationship('Gender', backref='students')
    level = db.relationship('Level', backref='students')
    campus = db.relationship('Campus', backref='students')
    state = db.relationship('State', backref='students')
    nationality = db.relationship('Nationality', backref='students')
    ethnicity = db.relationship('Ethnicity', backref='students')
    suffix = db.relationship('Suffix', backref='students')
    divisions = db.relationship('Divisions', backref='students')
    comments = db.relationship('Comment', backref='student', lazy=True)
   
    
    

class Faculty(db.Model):
    __tablename__ = 'faculty'

    faculty_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255))
    department = db.Column(db.String(255))
    role = db.Column(db.String(255))
    phone_number = db.Column(db.String(20))
    email = db.Column(db.String(255))
    address = db.Column(db.String(255))
    address2 = db.Column(db.String(255))
    city = db.Column(db.String(255))
    state = db.Column(db.String(255))
    zip = db.Column(db.String(255))
    emergency_contact_name = db.Column(db.String(255))
    emergency_contact_type = db.Column(db.String(255))
    emergency_contact_phone = db.Column(db.String(255))

class Staff(db.Model):
    __tablename__ = 'staff'

    staff_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    phone_number = db.Column(db.String(20))
    email = db.Column(db.String(255))
    address = db.Column(db.String(255))
    emergency_contact = db.Column(db.String(255))

class Comment(db.Model):
    __tablename__ = 'tbl_comments'

    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_id = db.Column(db.Integer, db.ForeignKey('tbl_student.student_id'), nullable=False)
    comment_text = db.Column(db.String(2500))
    comment_by = db.Column(db.String(45))
    comment_date = db.Column(db.Date)
    comment_level = db.Column(db.String(45))

class User(db.Model):
    __tablename__ = 'tbl_users'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    prefix_id = db.Column(db.Integer, db.ForeignKey('tbl_prefix.prefix_id'))
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    suffix_id = db.Column(db.Integer, db.ForeignKey('tbl_suffix.suffix_id'))
    role_id = db.Column(db.Integer, db.ForeignKey('tbl_role.role_id'))
    username = db.Column(db.String(50))
    password = db.Column(db.String(255))
    email = db.Column(db.String(100))
    phone_number = db.Column(db.String(20))
    date_of_birth = db.Column(db.Date)
    address = db.Column(db.String(255))
    address2 = db.Column(db.String(255))
    city = db.Column(db.String(255))
    state_id = db.Column(db.Integer, db.ForeignKey('tbl_state.state_id'))
    zip = db.Column(db.String(255))
    profile_picture = db.Column(db.String(255))
    acc_status_id = db.Column(db.Integer, db.ForeignKey('tbl_account_statuses.acc_status_id'))
    registration_date = db.Column(db.TIMESTAMP, server_default=db.func.current_timestamp())



class Role(db.Model):
    __tablename__ = 'tbl_role'

    role_id = db.Column(db.Integer, primary_key=True)
    role_name = db.Column(db.String(50))
 
class Account_status(db.Model):
    __tablename__ = 'tbl_account_statuses'
    
    acc_status_id = db.Column(db.Integer, primary_key=True)
    acc_status_name = db.Column(db.String(45))
    
class DormManager(db.Model):
    __tablename__ = 'tbl_dorm_manager'

    manager_id = db.Column(db.Integer, primary_key=True)
    manager_name = db.Column(db.String(100), nullable=False)
    dormitory_id = db.Column(db.Integer, db.ForeignKey('tbl_dormitory.dormitory_id'), nullable=False)
    # Add other manager fields

class Dormitory(db.Model):
    __tablename__ = 'tbl_dormitory'

    dormitory_id = db.Column(db.Integer, primary_key=True)
    dormitory_name = db.Column(db.String(100), nullable=False)
    # Add other dormitory fields

    rooms = db.relationship('Room', backref='dormitory', lazy=True)

class Room(db.Model):
    __tablename__ = 'tbl_room'

    room_id = db.Column(db.Integer, primary_key=True)
    room_number = db.Column(db.String(20), nullable=False)
    dormitory_id = db.Column(db.Integer, db.ForeignKey('tbl_dormitory.dormitory_id'), nullable=False)
    # Add other room fields

    students = db.relationship('Student', backref='room', lazy=True)

class StudentRoomAssignment(db.Model):
    __tablename__ = 'tbl_student_room_assignment'

    id = db.Column(db.Integer, primary_key=True)
    student_id = db.Column(db.Integer, db.ForeignKey('tbl_student.student_id'), nullable=False)
    room_id = db.Column(db.Integer, db.ForeignKey('tbl_room.room_id'), nullable=False)
    # You can add more fields specific to this relationship if needed
