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


DROP TABLE IF EXISTS `dorm`;
CREATE TABLE `dorm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dorm_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `num_rooms` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `dorm_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `dorm_manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `dorm_manager`;
CREATE TABLE `dorm_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `dorm_room`;
CREATE TABLE `dorm_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `dorm_id` int(11) NOT NULL,
  `current_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dorm_id` (`dorm_id`),
  CONSTRAINT `dorm_room_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `dorm` (`id`)
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


DROP TABLE IF EXISTS `student_room`;
CREATE TABLE `student_room` (
  `student_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  KEY `room_id` (`room_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `dorm_room` (`id`),
  CONSTRAINT `student_room_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
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

INSERT INTO `tbl_student` (`student_id`, `student_fname`, `student_mname`, `student_lname`, `student_suffix_id`, `student_goesby`, `student_gender_id`, `student_level_id`, `student_division_id`, `student_age`, `student_birthday`, `student_address`, `student_address2`, `student_city`, `student_state_id`, `student_zip`, `student_district`, `student_status`, `student_enrolled`, `student_campus_id`, `student_nationality_id`, `student_ethnicity_id`) VALUES
(11,	'Jeremy',	'David',	'Stitch',	8,	'None',	2,	8,	1,	'11',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	185,	1),
(12,	'Quinton',	'None',	'Kocher',	1,	'None',	2,	14,	1,	'18',	'2023-07-04',	'None',	'None',	'None',	35,	'None',	'None',	'1',	'2023-09-01',	1,	185,	1),
(13,	'Lander',	NULL,	'Busse',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(14,	'Badge',	NULL,	'Busse',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(15,	'Daniel',	NULL,	'Beresky',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(16,	'David',	NULL,	'Beresky',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(17,	'Derek',	NULL,	'Beresky',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(26,	'Ron',	NULL,	'Allen',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(27,	'William',	NULL,	'Arthur',	NULL,	NULL,	2,	14,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(29,	'Jeff',	'None',	'Bania',	1,	'None',	2,	11,	1,	'14',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(31,	'Thomas',	NULL,	'Brown',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(34,	'Jeff',	NULL,	'Clay',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(37,	'Greg',	'None',	'Hochstetler',	8,	'Geg',	2,	2,	1,	'5',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(39,	'Tim',	NULL,	'Johnson',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(40,	'Eric',	NULL,	'Johnson',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(41,	'Jerry',	NULL,	'King',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(42,	'James',	NULL,	'Lambright',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(43,	'Heath',	NULL,	'Lambright',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(44,	'Rod',	NULL,	'Linville',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(45,	'Brent',	NULL,	'Lowe',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(46,	'Rex',	NULL,	'Lowe',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(47,	'Brian',	NULL,	'Miller',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(48,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(49,	'Frank',	NULL,	'Oren',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(51,	'Matthew',	NULL,	'Patsch',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(53,	'Chris',	NULL,	'Ricker',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(54,	'Alan',	NULL,	'Ripper',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(55,	'Adam',	'None',	'Ripper',	1,	'None',	2,	9,	1,	'12',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(58,	'Tim',	NULL,	'Scheutzow',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(59,	'Jim',	NULL,	'Surratt',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(61,	'George',	NULL,	'Vermilyea',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(64,	'Michael',	NULL,	'Winter',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(65,	'David',	NULL,	'Winter',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(69,	'Bill',	NULL,	'Bixby',	NULL,	NULL,	2,	2,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(71,	'Justin',	NULL,	'Brenenstuhl',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(74,	'Bruce',	NULL,	'Collier',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(75,	'Matthew',	NULL,	'Hoert',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(76,	'Chad',	NULL,	'Hoert',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(77,	'Joshua',	NULL,	'Hoert',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(78,	'Zach',	NULL,	'Misenko',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(79,	'Adam',	NULL,	'Misenko',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(80,	'Seth',	NULL,	'Misenko',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(83,	'Rob',	NULL,	'Cook',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(90,	'Shawn',	NULL,	'Gebbie',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(92,	'Christopher',	NULL,	'Conwill',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(93,	'David',	NULL,	'Conwill',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(94,	'David',	NULL,	'Gillespie',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(99,	'John Mark',	NULL,	'Hershberger',	NULL,	NULL,	2,	2,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(103,	'Kurt',	NULL,	'Kramer',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(104,	'Kenton',	NULL,	'Kramer',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(105,	'Tommy',	'None',	'Lamborn',	1,	'None',	2,	8,	1,	'11',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(106,	'David',	NULL,	'Lamborn',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(107,	'Michael',	'None',	'Leach',	1,	'None',	2,	4,	1,	'7',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(113,	'Jonathan',	NULL,	'Sommer',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(116,	'Timothy',	NULL,	'McQuerry',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(117,	'Todd',	NULL,	'Meridith',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(121,	'Sean',	NULL,	'Miller',	NULL,	NULL,	2,	2,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(122,	'Reed',	NULL,	'Monegan',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(124,	'Steve',	NULL,	'Nowack',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(125,	'Matthew',	NULL,	'Oates',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(127,	'Kevin',	NULL,	'Payne',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(129,	'Rick',	NULL,	'Powers',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(130,	'Joshua',	NULL,	'Powers',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(132,	'Ryan',	NULL,	'Roberts',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(133,	'Darin',	NULL,	'Rosenvold',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(135,	'Jeff',	NULL,	'Roth',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(136,	'Jonathan',	NULL,	'Roth',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(137,	'John',	NULL,	'Sebestyen',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(138,	'David',	NULL,	'Snyder',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(139,	'Timothy',	NULL,	'Work',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(140,	'Andrew',	NULL,	'Male',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(144,	'William',	NULL,	'Surgeon',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(146,	'Ben',	NULL,	'toot',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(147,	'Michael',	NULL,	'Smith',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(149,	'Robert',	NULL,	'Ward',	NULL,	NULL,	2,	2,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(150,	'Bob',	NULL,	'Weinerheimer',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(151,	'Jeff',	NULL,	'Williams',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(152,	'Bo',	NULL,	'Wilson',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(153,	'Bill',	NULL,	'Wilson',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(154,	'Brian',	NULL,	'Wolf',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(157,	'Jay',	NULL,	'Hardback',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(158,	'Joe',	NULL,	'Phillips',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(159,	'Linden',	NULL,	'Phillips',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(161,	'Tom',	NULL,	'Smith',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(162,	'Thomas',	NULL,	'Ellison',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(163,	'Ben',	NULL,	'Legg',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(164,	'Marty',	NULL,	'Walker',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(166,	'Bobby',	NULL,	'Scandlon',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(167,	'Patrick',	NULL,	'Scandlon',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(168,	'Willard',	NULL,	'Scandlon',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(169,	'Austin',	NULL,	'Scandlon',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(170,	'Jimmy',	NULL,	'Myers',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(175,	'Tony',	NULL,	'Dulgar',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(176,	'Clifford',	NULL,	'Phillips',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(177,	'Scott',	NULL,	'Phillips',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(181,	'Rodge',	NULL,	'Campbel',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(182,	'Matthew',	NULL,	'Perkins',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(183,	'Leroy',	NULL,	'Meadows',	NULL,	NULL,	2,	2,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(185,	'John',	NULL,	'Mullins',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(186,	'Clifford',	NULL,	'Roop',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(187,	'Timothy',	NULL,	'Roop',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(189,	'Kim',	NULL,	'Roose',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(190,	'Stephen',	NULL,	'Schritz',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(191,	'Bryan',	NULL,	'Schritz',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(193,	'Michael',	NULL,	'Tanner',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(194,	'Michael',	NULL,	'Vanek',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(195,	'Aaron',	NULL,	'Whitty',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(198,	'Paul',	NULL,	'Brentlinger',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(199,	'Paul',	NULL,	'DeHart',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(200,	'Nate',	NULL,	'DeHart',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(201,	'Nate',	NULL,	'Wolf',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(202,	'Grant',	NULL,	'Steyer',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(203,	'Todd',	NULL,	'Steyer',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(204,	'Teddy',	NULL,	'Guyulas',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(205,	'Tommy',	'None',	'Guyulas',	8,	'None',	2,	10,	1,	'13',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(206,	'Wyatt',	NULL,	'Cravatas',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(207,	'Michael',	NULL,	'Deuring',	NULL,	NULL,	2,	3,	NULL,	'5',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(208,	'Aaron',	NULL,	'Hicks',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(209,	'Doug',	NULL,	'Dougherty',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(211,	'Matthew',	NULL,	'Honaker',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(212,	'Anthony',	NULL,	'Brozzowski',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(213,	'Andrew',	'None',	'Konya',	1,	'None',	2,	5,	1,	'8',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(215,	'Fred',	NULL,	'Leach',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(216,	'Cole',	NULL,	'Morgan',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(217,	'Keeler',	NULL,	'North',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(218,	'Jason',	NULL,	'Routzon',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(219,	'Jim',	NULL,	'Shimer',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(220,	'Kevin',	NULL,	'Tinter',	NULL,	NULL,	2,	1,	NULL,	'4',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(221,	'Daniel',	NULL,	'Tousley',	NULL,	NULL,	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(223,	'Paul',	NULL,	'Tousley',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(224,	'Adam',	NULL,	'Whitney',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(226,	'Seth',	NULL,	'Whitney',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(227,	'Wesley',	NULL,	'Loudermilk',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(229,	'Emerson',	NULL,	'Ziegler',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(230,	'Harrison',	NULL,	'Ziegler',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(231,	'Wesley',	NULL,	'Ziegler',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(232,	'Charles',	'None',	'Ziegler',	1,	'None',	2,	8,	1,	'11',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(233,	'David',	NULL,	'Mullins',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(234,	'Scott',	NULL,	'Severence',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(235,	'Jason',	NULL,	'Stephens',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(238,	'Brad',	NULL,	'Seivers',	NULL,	NULL,	2,	3,	NULL,	'6',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(239,	'Zach',	NULL,	'Oswold',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(240,	'Wes',	NULL,	'Boggs',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(241,	'Matthew',	NULL,	'Strang',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(243,	'David',	NULL,	'Meisner',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(244,	'Wyatt',	NULL,	'Henderson',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(245,	'Adam',	NULL,	'Wonus',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(246,	'Matthew',	NULL,	'McCleese',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(247,	'Cameron',	NULL,	'Vogle',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(248,	'Bodie',	NULL,	'Hillwig',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(249,	'Kevin',	NULL,	'Pesheck',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(250,	'Ian',	NULL,	'Pesheck',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(251,	'Christian',	'None',	'Pesheck',	1,	'None',	2,	7,	1,	'10',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(252,	'Andy',	NULL,	'Zywick',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(253,	'John',	NULL,	'Zywick',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(254,	'David',	NULL,	'Brown',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(255,	'Andrew',	NULL,	'Stefan',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(256,	'Matthew',	NULL,	'Stefan',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(257,	'Christopher',	NULL,	'Brown',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(259,	'Ben',	NULL,	'Olsen',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(261,	'Bryce',	NULL,	'Sedio',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(262,	'Jared',	NULL,	'Wills',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(263,	'Nick',	NULL,	'WIlls',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(264,	'Casey',	NULL,	'O\'Brian',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(265,	'Shawn',	NULL,	'O\'Brian',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(266,	'Jason',	NULL,	'Linden',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(267,	'Perry',	NULL,	'Cohen',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(268,	'Austin',	'None',	'Stephanos',	1,	'None',	2,	10,	1,	'13',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(269,	'Steven',	'None',	'Roque',	1,	'None',	2,	9,	1,	'12',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(270,	'Nathan',	NULL,	'Roque',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(272,	'Geoffry',	NULL,	'Martel',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(273,	'Gregory',	'None',	'Martel',	1,	'None',	2,	8,	1,	'11',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(274,	'Grant',	'None',	'Martel',	1,	'None',	2,	12,	1,	'15',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(277,	'Eric',	'None',	'Clinton',	1,	'None',	2,	11,	1,	'14',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(278,	'J\'mark',	NULL,	'Boliver',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(279,	'J\'Herne',	NULL,	'Boliver',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(280,	'Mark',	NULL,	'Zurowski',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(281,	'Matthew',	NULL,	'Zurowski',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(282,	'Michael',	NULL,	'Zurowski',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(283,	'Duncan',	NULL,	'McCord',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(284,	'Malcom',	NULL,	'McCord',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(285,	'Angus',	NULL,	'McCord',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(286,	'Clay',	NULL,	'Parris',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(287,	'Kendall',	NULL,	'Virginia',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(288,	'Mathias',	NULL,	'Uribe',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(289,	'Nicholas',	NULL,	'Uribe',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(290,	'Michael',	NULL,	'Stolzenberg',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(291,	'Harris',	NULL,	'Stolzenberg',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(292,	'Philip',	NULL,	'Mashki',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(293,	'Philip',	NULL,	'Mahi',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(294,	'Florian',	NULL,	'France',	NULL,	NULL,	2,	10,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(295,	'Julian',	NULL,	'France',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(297,	'Donny',	NULL,	'harmison',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(299,	'Donny',	NULL,	'MPMS',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(300,	'Chris',	NULL,	'Keope',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(301,	'Jake',	NULL,	'Carner',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(302,	'Jake',	NULL,	'Jurowski',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(303,	'Robbie',	'None',	'MPMS',	1,	'None',	2,	10,	1,	'14',	'2023-07-04',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-09-01',	1,	1,	1),
(304,	'Phillip',	NULL,	'Green',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(305,	'Shawn',	NULL,	'Green',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(306,	'shawn',	NULL,	'gray',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(307,	'Brandon',	NULL,	'Knight',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(308,	'Phillip',	NULL,	'Wilsie',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(309,	'Caleb',	NULL,	'Hollo',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(310,	'Jared',	NULL,	'Grey',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(311,	'Redmond',	NULL,	'Gerard',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(312,	'Tom',	NULL,	'Holland',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(313,	'Lucas',	NULL,	'Judy',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(314,	'Lucas',	NULL,	'Benentt',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(315,	'Jared',	NULL,	'Enting',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(316,	'Jared',	NULL,	'MPMS',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(317,	'Frank',	NULL,	'Panstingal',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(318,	'Adrian',	NULL,	'Wilson',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(319,	'Cory',	NULL,	'Saddler',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(320,	'Nick',	NULL,	'Markley',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(321,	'Telo ',	NULL,	'Grove',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(324,	'Danny',	NULL,	'Bevan',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(328,	'Josh',	NULL,	'Green',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(329,	'Garett',	NULL,	'Stewart',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(331,	'Mark',	NULL,	'Bazemore',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(332,	'John',	NULL,	'McVicker',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(333,	'Frank',	NULL,	'DeCapio',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(334,	'Mark',	NULL,	'Sunde',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(335,	'Jeremy',	NULL,	'Morningstar',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(336,	'Jordan',	NULL,	'Zolman',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(337,	'John',	NULL,	'Skyview',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(338,	'Mason',	NULL,	'Cooley',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(339,	'Connor',	NULL,	'masonfriend',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(340,	'Greg',	NULL,	'Kinitis',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(341,	'Adam',	NULL,	'Johnson',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(342,	'Justin',	NULL,	'Bonheim',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(343,	'Blake',	NULL,	'Bonheim',	NULL,	NULL,	2,	5,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(344,	'Andrew',	NULL,	'Sherer',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(345,	'Mark',	NULL,	'Zuiderveen',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(346,	'Jim',	NULL,	'Ringer',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(347,	'Jason',	NULL,	'Mascari',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(348,	'brent',	NULL,	'Davis',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(349,	'Danny',	NULL,	'Kyper',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(350,	'Danny',	NULL,	'Webster',	NULL,	NULL,	2,	11,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(351,	'clay',	NULL,	'Febus',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(352,	'Brian',	NULL,	'clayfriend',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(353,	'David',	NULL,	'Farley',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(354,	'Tyler',	NULL,	'Andrew',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(355,	'Brian',	NULL,	'Vickers',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(356,	'Anthony',	NULL,	'PIasano',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(357,	'Zach',	NULL,	'Arnold',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(358,	'Brandon',	NULL,	'Kaskey',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(359,	'Jimmy',	NULL,	'Kaskey',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(360,	'Jimmy',	NULL,	'Guess',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(361,	'Eric',	NULL,	'Guillentine',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(362,	'Joshua',	NULL,	'Mullins',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(363,	'Nathan',	NULL,	'Cunningham',	NULL,	NULL,	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(364,	'Seth',	NULL,	'Cunningham',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(365,	'Benny',	NULL,	'Cunningham',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(367,	'Alexi',	NULL,	'Ivanovich',	NULL,	NULL,	2,	8,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(368,	'Ivan',	NULL,	'Demitrovich',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(369,	'Dale',	NULL,	'Berskin',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(370,	'Matt',	NULL,	'Carper',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(371,	'Jack',	NULL,	'Carper',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(372,	'Austin',	NULL,	'Oh',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(373,	'Ryan',	NULL,	'Hornack',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(374,	'Shawn',	NULL,	'Baisden',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(375,	'Jimmy',	NULL,	'Meyers',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(376,	'Jimmy',	NULL,	'Murphy',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(377,	'Brad',	NULL,	'Brock',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(378,	'Randy',	NULL,	'Richner',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(381,	'Andrew',	NULL,	'Witzak',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(382,	'Andrew',	NULL,	'Williams',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(383,	'Kyle',	NULL,	'Bruffy',	NULL,	NULL,	2,	10,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(384,	'Alex',	NULL,	'dakota',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(385,	'Danny',	NULL,	'Dakota',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(386,	'David',	NULL,	'Calif',	NULL,	NULL,	2,	13,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(387,	'Jeremy',	NULL,	'playfirstbase',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(388,	'David',	NULL,	'Jamison',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(389,	'Barry',	NULL,	'Horvath',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(390,	'Marc',	NULL,	'Berry',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(391,	'Marc',	NULL,	'Calif',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(392,	'Troy',	NULL,	'Berry',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(393,	'Kyle',	NULL,	'Chippewa',	NULL,	NULL,	2,	10,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(394,	'Matthew',	NULL,	'Lacrosse',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(395,	'Derwin',	NULL,	'Loverink',	NULL,	NULL,	2,	13,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(396,	'Peter',	NULL,	'Loverink',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(397,	'Aiden',	NULL,	'Loverink',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(398,	'Gordy',	NULL,	'Sanders',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(399,	'Nico',	NULL,	'White',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(400,	'Tommy',	NULL,	'Brady',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(401,	'Aaron',	NULL,	'Green',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(405,	'Mike',	NULL,	'Long',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(406,	'Mike',	NULL,	'Cole',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(407,	'Jordan',	NULL,	'Grills',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(408,	'Johnny',	NULL,	'McDougal',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(409,	'Steve',	NULL,	'Brown',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(410,	'Greg',	NULL,	'Streme',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(411,	'Abdul',	NULL,	'Gassed',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(412,	'Greg ',	NULL,	'Cornelius',	NULL,	NULL,	2,	10,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(414,	'Bobby',	NULL,	'Pembridge',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(415,	'Tim',	NULL,	'Miskimen',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(416,	'Ryan',	NULL,	'O\'Callaghan',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(417,	'Eric',	NULL,	'O\'Callaghan',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(419,	'Codi',	NULL,	'Schmidt-McPhee',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(420,	'Ty',	NULL,	'Sheridin',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(421,	'Jacob seth',	NULL,	'Loughland',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(422,	'Seth',	NULL,	'Clearwater',	NULL,	NULL,	2,	12,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(423,	'Thomas',	NULL,	'Brodi-Sanger',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(424,	'Mickey',	NULL,	'Matson',	NULL,	NULL,	2,	11,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(425,	'Brett',	NULL,	'Portage',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(426,	'Brett',	NULL,	'Nau',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(427,	'David',	NULL,	'Wright',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(428,	'Frankie',	NULL,	'Suthard',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(429,	'Cody',	NULL,	'Suthard',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(430,	'Jase',	NULL,	'Suthard',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(431,	'Philip',	NULL,	'Smith-bros',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(432,	'Reshet',	NULL,	'Moti',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(433,	'CJ',	NULL,	'Scout',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(434,	'Caleb',	NULL,	'Scout',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(435,	'Chris',	NULL,	'Scout',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(437,	'Misha',	NULL,	'Hotel',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(438,	'Matty',	NULL,	'Aussie',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(439,	'Julian',	NULL,	'Aussie',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(440,	'Mikey',	NULL,	'Argy',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(441,	'Sandro',	NULL,	'Argy',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(442,	'Jeremy',	NULL,	'Kocher',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(443,	'Zach',	NULL,	'Kocher',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(444,	'Gregory',	NULL,	'Petek',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(445,	'Thomas',	NULL,	'Petek',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(446,	'Mark',	NULL,	'Regowski',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(447,	'Randall',	NULL,	'Bolinger',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(448,	'Eric',	NULL,	'Larson',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(449,	'Steven',	NULL,	'Larson',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(450,	'Carter',	NULL,	'Bratton',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(451,	'Rotem',	NULL,	'Mathias',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(452,	'Erick',	NULL,	'Johnson',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(454,	'Jacob',	NULL,	'Wetterling',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(455,	'Tom',	NULL,	'Daley',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(456,	'Tom',	NULL,	'Danley',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(457,	'Brig',	NULL,	'Miller',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(458,	'Dillon',	NULL,	'Weisler',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(459,	'Jaden',	NULL,	'Henline',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(463,	'Ryan',	NULL,	'McManus',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(464,	'Jacob',	NULL,	'Miracle',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(465,	'Aiden',	NULL,	'Bryant',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(466,	'Bo',	NULL,	'Folger',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(467,	'Tyler',	NULL,	'Folger',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(468,	'Lucas',	NULL,	'Folger',	NULL,	NULL,	2,	10,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(469,	'Cort',	NULL,	'Oregon',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(470,	'David',	NULL,	'Whitewolf',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(471,	'Ralph',	NULL,	'Marachio',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(472,	'Devon',	NULL,	'Sawa',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(473,	'Greg',	NULL,	'Xenon',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(474,	'Robert',	NULL,	'Irwin',	NULL,	NULL,	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(475,	'Drilon',	NULL,	'Krane',	NULL,	NULL,	2,	6,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(476,	'Drin',	NULL,	'Krane',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(477,	'Lucas',	NULL,	'Wallencheck',	NULL,	NULL,	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(478,	'Brian',	NULL,	'Clouds',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(479,	'Charlie',	NULL,	'Bandan',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(480,	'Tyler',	NULL,	'VA',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(481,	'Grayson',	NULL,	'DC',	NULL,	NULL,	2,	13,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(482,	'Tanner',	NULL,	'VA',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(483,	'Taylor',	NULL,	'Starr',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(484,	'Hunter',	NULL,	'Starr',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(485,	'Thomas',	NULL,	'Tex',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(486,	'Robert',	NULL,	'Burroughs',	NULL,	NULL,	2,	5,	NULL,	'9',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(487,	'David',	NULL,	'Anthony',	NULL,	NULL,	2,	4,	NULL,	'7',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(488,	'William',	NULL,	'Blakeney',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(489,	'Philip',	NULL,	'Model',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(490,	'Scott',	NULL,	'Allen',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(491,	'Scott',	NULL,	'Drummond',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(492,	'Ron',	NULL,	'Drummond',	NULL,	NULL,	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(493,	'Brett',	NULL,	'Klauss',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(494,	'Jason',	NULL,	'Klauss',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(496,	'Zach',	NULL,	'Garner',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(497,	'Keegan',	NULL,	'Garner',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(498,	'Zach',	NULL,	'Mesinko',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(499,	'Adam',	NULL,	'Mesinko',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(500,	'Danny',	NULL,	'Chambers',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(501,	'Danny',	NULL,	'Honeycutt',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(502,	'Danny',	NULL,	'Winton',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(503,	'Lars',	NULL,	'Eckburg',	NULL,	NULL,	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(509,	'Duke',	'',	'Gains',	NULL,	'Duke',	2,	10,	NULL,	'13',	'2023-07-04',	'',	'',	'Waco',	NULL,	'',	'',	NULL,	'2023-09-01',	1,	NULL,	NULL),
(510,	'Jeff',	NULL,	'Mohler',	NULL,	'Jeff',	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(511,	'Andrew',	NULL,	'Mohler',	NULL,	'Andy',	2,	11,	NULL,	'14',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(512,	'Nathan',	'Lloyd',	'Mohler',	NULL,	NULL,	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(513,	'Jacob',	'Lloyd',	'Mohler',	NULL,	NULL,	2,	12,	NULL,	'15',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(514,	'Martin',	'Lloyd',	'Mohler',	NULL,	NULL,	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(515,	'Randall',	'Lloyd',	'Mohler',	NULL,	NULL,	2,	6,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(516,	'Jeremy',	NULL,	'Reeder',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(517,	'Ben',	NULL,	'Hawley',	NULL,	NULL,	2,	7,	NULL,	'10',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(518,	'Joshua',	NULL,	'Robb',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(519,	'JJ',	NULL,	'Robb',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(520,	'Joey',	NULL,	'Robb',	NULL,	NULL,	2,	6,	NULL,	'8',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(521,	'Ilia',	NULL,	'Malinin',	NULL,	'Ilia',	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(522,	'Simon',	NULL,	'Brown',	NULL,	'Simon',	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(523,	'Tyler',	'',	'Kobel',	NULL,	'Tyler',	2,	9,	NULL,	'12',	'2023-07-04',	'',	'',	'',	NULL,	'',	'',	NULL,	'2023-09-01',	1,	NULL,	NULL),
(524,	'Mario',	NULL,	'Roulette',	NULL,	'Mario',	2,	8,	NULL,	'11',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(525,	'Rick',	NULL,	'Dancer',	NULL,	'Ricky',	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(526,	'Gabriel',	NULL,	'Silva',	NULL,	'Gabe',	2,	14,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(527,	'Joshua',	NULL,	'Kontour',	NULL,	'Josh',	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(528,	'Evan',	NULL,	'Kontour',	NULL,	NULL,	2,	13,	NULL,	'17',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(529,	'Joshua',	NULL,	'Dundr',	NULL,	NULL,	2,	9,	NULL,	'12',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	NULL,	NULL,	NULL),
(530,	'David',	NULL,	'Merk',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	NULL,	NULL,	NULL),
(531,	'Charles',	NULL,	'Ridley',	NULL,	'Chaz',	2,	14,	NULL,	'18',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(532,	'Johnathan',	NULL,	'Ridley',	NULL,	'John',	2,	12,	NULL,	'16',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(533,	'Paul',	NULL,	'Ridley',	NULL,	NULL,	2,	10,	NULL,	'13',	'2023-07-04',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-09-01',	1,	NULL,	NULL),
(534,	'Michael',	NULL,	'Slayton',	NULL,	NULL,	2,	6,	NULL,	'9',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(535,	'Christian',	NULL,	'Slayton',	NULL,	NULL,	2,	12,	NULL,	'15',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(536,	'Levi',	NULL,	'McCoaughey',	NULL,	NULL,	2,	12,	NULL,	'15',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(537,	'Livingston',	NULL,	'McConaughey',	NULL,	NULL,	2,	7,	NULL,	'10',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(538,	'William',	NULL,	'Vance',	1,	'Willie',	2,	11,	NULL,	'15',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(539,	'Andrew',	'William',	'Miller',	NULL,	'Andrew',	2,	6,	NULL,	'9',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(540,	'Bradley',	'None',	'Little',	1,	'Lil Brad',	2,	6,	1,	'9',	'2023-07-16',	'None',	'None',	'None',	1,	'None',	'None',	'1',	'2023-11-05',	1,	1,	1),
(541,	'Curtis',	'James',	'Post',	NULL,	'CJ',	2,	8,	NULL,	'11',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(542,	'Scout',	NULL,	'Beachovich',	NULL,	'Scout',	2,	7,	NULL,	'10',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2,	NULL,	NULL),
(543,	'Deven',	NULL,	'Jackson',	NULL,	'Gabriel',	2,	13,	NULL,	'17',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL),
(544,	'Casey',	NULL,	'Likes',	NULL,	'Marty McFly',	2,	13,	NULL,	'17',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

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


-- 2023-11-28 23:40:10
