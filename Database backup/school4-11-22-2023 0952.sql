-- Adminer 4.8.1 MySQL 5.5.5-10.6.12-MariaDB-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `school4`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_type` varchar(255) DEFAULT NULL,
  `emergency_contact_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emergency_contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_account_statuses`;
CREATE TABLE `tbl_account_statuses` (
  `acc_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acc_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_campus`;
CREATE TABLE `tbl_campus` (
  `campus_id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_name` varchar(45) NOT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_comments`;
CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `comment_text` varchar(2500) DEFAULT NULL,
  `comment_by` varchar(45) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_level` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_comments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_divisions`;
CREATE TABLE `tbl_divisions` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(45) NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_dormitory`;
CREATE TABLE `tbl_dormitory` (
  `dormitory_id` int(11) NOT NULL AUTO_INCREMENT,
  `dormitory_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dormitory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_dorm_manager`;
CREATE TABLE `tbl_dorm_manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(100) NOT NULL,
  `dormitory_id` int(11) NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `dormitory_id` (`dormitory_id`),
  CONSTRAINT `tbl_dorm_manager_ibfk_1` FOREIGN KEY (`dormitory_id`) REFERENCES `tbl_dormitory` (`dormitory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_ethnicity`;
CREATE TABLE `tbl_ethnicity` (
  `ethnicity_id` int(11) NOT NULL AUTO_INCREMENT,
  `ethnicity_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_gender`;
CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_levels`;
CREATE TABLE `tbl_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(45) NOT NULL,
  `level_abbrev` varchar(45) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_nationality`;
CREATE TABLE `tbl_nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(45) NOT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_prefix`;
CREATE TABLE `tbl_prefix` (
  `prefix_id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix_name` varchar(45) NOT NULL,
  PRIMARY KEY (`prefix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_room`;
CREATE TABLE `tbl_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(20) NOT NULL,
  `dormitory_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `dormitory_id` (`dormitory_id`),
  CONSTRAINT `tbl_room_ibfk_1` FOREIGN KEY (`dormitory_id`) REFERENCES `tbl_dormitory` (`dormitory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_state`;
CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(45) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE `tbl_status` (
  `student_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_status` varchar(45) NOT NULL,
  PRIMARY KEY (`student_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_fname` varchar(45) DEFAULT NULL,
  `student_mname` varchar(45) DEFAULT NULL,
  `student_lname` varchar(45) DEFAULT NULL,
  `student_suffix_id` int(11) DEFAULT NULL,
  `student_goesby` varchar(45) DEFAULT NULL,
  `student_gender_id` int(11) DEFAULT NULL,
  `student_level_id` int(11) DEFAULT NULL,
  `student_division_id` int(11) DEFAULT NULL,
  `student_age` varchar(45) DEFAULT NULL,
  `student_birthday` date DEFAULT NULL,
  `student_address` varchar(45) DEFAULT NULL,
  `student_address2` varchar(45) DEFAULT NULL,
  `student_city` varchar(45) DEFAULT NULL,
  `student_state_id` int(11) DEFAULT NULL,
  `student_zip` varchar(45) DEFAULT NULL,
  `student_district` varchar(45) DEFAULT NULL,
  `student_status` varchar(45) DEFAULT NULL,
  `student_enrolled` date DEFAULT NULL,
  `student_campus_id` int(11) DEFAULT NULL,
  `student_nationality_id` int(11) DEFAULT NULL,
  `student_ethnicity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_gender_id` (`student_gender_id`),
  KEY `student_campus_id` (`student_campus_id`),
  KEY `student_state_id` (`student_state_id`),
  KEY `student_ethnicity_id` (`student_ethnicity_id`),
  KEY `student_suffix_id` (`student_suffix_id`),
  KEY `student_division_id` (`student_division_id`),
  KEY `student_nationality_id` (`student_nationality_id`),
  KEY `student_level_id` (`student_level_id`),
  CONSTRAINT `tbl_student_ibfk_10` FOREIGN KEY (`student_nationality_id`) REFERENCES `tbl_nationality` (`nationality_id`),
  CONSTRAINT `tbl_student_ibfk_11` FOREIGN KEY (`student_level_id`) REFERENCES `tbl_levels` (`level_id`),
  CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`student_gender_id`) REFERENCES `tbl_gender` (`gender_id`),
  CONSTRAINT `tbl_student_ibfk_3` FOREIGN KEY (`student_campus_id`) REFERENCES `tbl_campus` (`campus_id`),
  CONSTRAINT `tbl_student_ibfk_4` FOREIGN KEY (`student_state_id`) REFERENCES `tbl_state` (`state_id`),
  CONSTRAINT `tbl_student_ibfk_6` FOREIGN KEY (`student_ethnicity_id`) REFERENCES `tbl_ethnicity` (`ethnicity_id`),
  CONSTRAINT `tbl_student_ibfk_7` FOREIGN KEY (`student_suffix_id`) REFERENCES `tbl_suffix` (`suffix_id`),
  CONSTRAINT `tbl_student_ibfk_8` FOREIGN KEY (`student_division_id`) REFERENCES `tbl_divisions` (`division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `tbl_student_room_assignment`;
CREATE TABLE `tbl_student_room_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_student_room_assignment_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `tbl_room` (`room_id`),
  CONSTRAINT `tbl_student_room_assignment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_suffix`;
CREATE TABLE `tbl_suffix` (
  `suffix_id` int(11) NOT NULL AUTO_INCREMENT,
  `suffix` varchar(45) NOT NULL,
  PRIMARY KEY (`suffix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `suffix_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `acc_status_id` int(11) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `prefix_id` (`prefix_id`),
  KEY `suffix_id` (`suffix_id`),
  KEY `role_id` (`role_id`),
  KEY `state_id` (`state_id`),
  KEY `acc_status_id` (`acc_status_id`),
  CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`prefix_id`) REFERENCES `tbl_prefix` (`prefix_id`),
  CONSTRAINT `tbl_users_ibfk_2` FOREIGN KEY (`suffix_id`) REFERENCES `tbl_suffix` (`suffix_id`),
  CONSTRAINT `tbl_users_ibfk_4` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`),
  CONSTRAINT `tbl_users_ibfk_6` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`),
  CONSTRAINT `tbl_users_ibfk_7` FOREIGN KEY (`acc_status_id`) REFERENCES `tbl_account_statuses` (`acc_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 2023-11-22 14:52:19
