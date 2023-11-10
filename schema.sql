-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: school4
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_campus`
--

DROP TABLE IF EXISTS `tbl_campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_campus` (
  `campus_id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_name` varchar(45) NOT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_comments`
--

DROP TABLE IF EXISTS `tbl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_divisions`
--

DROP TABLE IF EXISTS `tbl_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_divisions` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(11) NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_dorm_managers`
--

DROP TABLE IF EXISTS `tbl_dorm_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dorm_managers` (
  `dm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dm_name` varchar(45) DEFAULT NULL,
  `dm_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_dorm_rooms`
--

DROP TABLE IF EXISTS `tbl_dorm_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dorm_rooms` (
  `droom_id` int(11) NOT NULL AUTO_INCREMENT,
  `droom_number` int(11) DEFAULT NULL,
  `droom_capacity` int(11) DEFAULT NULL,
  `droom_notes` varchar(500) DEFAULT NULL,
  `droom_phone` varchar(12) DEFAULT NULL,
  `droom_floor` varchar(12) DEFAULT NULL,
  `droom_unit` varchar(12) DEFAULT NULL,
  `dorm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`droom_id`),
  KEY `dorm_id` (`dorm_id`),
  CONSTRAINT `tbl_dorm_rooms_ibfk_1` FOREIGN KEY (`dorm_id`) REFERENCES `tbl_dorms` (`dorm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_dorms`
--

DROP TABLE IF EXISTS `tbl_dorms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dorms` (
  `dorm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dorm_name` varchar(45) DEFAULT NULL,
  `dorm_phone` varchar(45) DEFAULT NULL,
  `dorm_capacity` varchar(45) DEFAULT NULL,
  `dm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dorm_id`),
  KEY `dm_id` (`dm_id`),
  CONSTRAINT `tbl_dorms_ibfk_1` FOREIGN KEY (`dm_id`) REFERENCES `tbl_dorm_managers` (`dm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_ethnicity`
--

DROP TABLE IF EXISTS `tbl_ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ethnicity` (
  `ethnicity_id` int(11) NOT NULL AUTO_INCREMENT,
  `ethnicity_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ethnicity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_gender`
--

DROP TABLE IF EXISTS `tbl_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_housing`
--

DROP TABLE IF EXISTS `tbl_housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_housing` (
  `housing_id` int(11) NOT NULL AUTO_INCREMENT,
  `dorm_rooms_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`housing_id`),
  KEY `dorm_rooms_id` (`dorm_rooms_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_housing_ibfk_1` FOREIGN KEY (`dorm_rooms_id`) REFERENCES `tbl_dorm_rooms` (`droom_id`),
  CONSTRAINT `tbl_housing_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_levels`
--

DROP TABLE IF EXISTS `tbl_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(45) DEFAULT NULL,
  `level_abbrev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_nationality`
--

DROP TABLE IF EXISTS `tbl_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_nation` varchar(45) NOT NULL,
  `nationality_name` varchar(45) NOT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_prefix`
--

DROP TABLE IF EXISTS `tbl_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prefix` (
  `prefix_id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix_name` varchar(45) NOT NULL,
  PRIMARY KEY (`prefix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_state`
--

DROP TABLE IF EXISTS `tbl_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(45) DEFAULT NULL,
  `state_abbrev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status` (
  `student_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `student_enrolled` varchar(45) DEFAULT NULL,
  `student_campus_id` int(11) DEFAULT NULL,
  `student_nationality_id` int(11) DEFAULT NULL,
  `student_ethnicity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_level` (`student_level_id`),
  KEY `student_gender_id` (`student_gender_id`),
  KEY `student_campus_id` (`student_campus_id`),
  KEY `student_state_id` (`student_state_id`),
  KEY `student_nationality_id` (`student_nationality_id`),
  KEY `student_ethnicity_id` (`student_ethnicity_id`),
  KEY `student_suffix_id` (`student_suffix_id`),
  KEY `student_division` (`student_division_id`),
  CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`student_level_id`) REFERENCES `tbl_levels` (`level_id`),
  CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`student_gender_id`) REFERENCES `tbl_gender` (`gender_id`),
  CONSTRAINT `tbl_student_ibfk_3` FOREIGN KEY (`student_campus_id`) REFERENCES `tbl_campus` (`campus_id`),
  CONSTRAINT `tbl_student_ibfk_4` FOREIGN KEY (`student_state_id`) REFERENCES `tbl_state` (`state_id`),
  CONSTRAINT `tbl_student_ibfk_5` FOREIGN KEY (`student_nationality_id`) REFERENCES `tbl_nationality` (`nationality_id`),
  CONSTRAINT `tbl_student_ibfk_6` FOREIGN KEY (`student_ethnicity_id`) REFERENCES `tbl_ethnicity` (`ethnicity_id`),
  CONSTRAINT `tbl_student_ibfk_7` FOREIGN KEY (`student_suffix_id`) REFERENCES `tbl_suffix` (`suffix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_suffix`
--

DROP TABLE IF EXISTS `tbl_suffix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_suffix` (
  `suffix_id` int(11) NOT NULL AUTO_INCREMENT,
  `suffix` varchar(45) NOT NULL,
  PRIMARY KEY (`suffix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `account_status_id` int(11) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `prefix_id` (`prefix_id`),
  KEY `suffix_id` (`suffix_id`),
  KEY `role_id` (`role_id`),
  KEY `state_id` (`state_id`),
  KEY `account_status_id` (`account_status_id`),
  CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`prefix_id`) REFERENCES `tbl_prefix` (`prefix_id`),
  CONSTRAINT `tbl_users_ibfk_2` FOREIGN KEY (`suffix_id`) REFERENCES `tbl_suffix` (`suffix_id`),
  CONSTRAINT `tbl_users_ibfk_4` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`),
  CONSTRAINT `tbl_users_ibfk_5` FOREIGN KEY (`account_status_id`) REFERENCES `tbl_status` (`student_status_id`),
  CONSTRAINT `tbl_users_ibfk_6` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 18:23:14
