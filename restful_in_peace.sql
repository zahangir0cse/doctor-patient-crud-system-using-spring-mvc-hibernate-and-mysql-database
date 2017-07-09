/*
MySQL Data Transfer
Source Host: localhost
Source Database: restful_in_peace
Target Host: localhost
Target Database: restful_in_peace
Date: 2017-07-10 03.10.16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admission
-- ----------------------------
DROP TABLE IF EXISTS `admission`;
CREATE TABLE `admission` (
  `admission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `admission_date` date NOT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `FK_admission_patient_id` (`patient_id`),
  CONSTRAINT `FK_admission_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indoor
-- ----------------------------
DROP TABLE IF EXISTS `indoor`;
CREATE TABLE `indoor` (
  `indoor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` int(10) unsigned NOT NULL,
  `indoor_department` varchar(45) NOT NULL,
  PRIMARY KEY (`indoor_id`),
  KEY `FK_indoor_admission_id` (`admission_id`),
  CONSTRAINT `FK_indoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mi
-- ----------------------------
DROP TABLE IF EXISTS `mi`;
CREATE TABLE `mi` (
  `mi_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mi_name` varchar(45) NOT NULL,
  `mi_qualification` varchar(45) NOT NULL,
  `mi_address` varchar(45) NOT NULL,
  `mi_gender` varchar(45) NOT NULL,
  `mi_contact_no` varchar(45) NOT NULL,
  `mi_email` varchar(45) NOT NULL,
  `outdoor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mi_id`),
  KEY `FK_mi_outdoor_id` (`outdoor_id`),
  CONSTRAINT `FK_mi_outdoor_id` FOREIGN KEY (`outdoor_id`) REFERENCES `outdoor` (`outdoor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for outdoor
-- ----------------------------
DROP TABLE IF EXISTS `outdoor`;
CREATE TABLE `outdoor` (
  `outdoor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`outdoor_id`),
  KEY `FK_outdoor_admission_id` (`admission_id`),
  CONSTRAINT `FK_outdoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(45) NOT NULL,
  `patient_age` int(10) unsigned NOT NULL,
  `patient_gender` varchar(45) NOT NULL,
  `patient_address` varchar(45) NOT NULL,
  `patient_contact_no` varchar(45) NOT NULL,
  `patient_email` varchar(45) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for released_patient
-- ----------------------------
DROP TABLE IF EXISTS `released_patient`;
CREATE TABLE `released_patient` (
  `released_patient_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `released_date` date NOT NULL,
  `old_patient_id` int(10) unsigned NOT NULL,
  `old_patient_name` varchar(45) NOT NULL,
  `old_patient_address` varchar(45) NOT NULL,
  `old_patient_age` int(10) unsigned NOT NULL,
  `old_patient_contact_no` varchar(45) NOT NULL,
  `old_patient_email` varchar(45) NOT NULL,
  `old_patient_gender` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  PRIMARY KEY (`released_patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specialist
-- ----------------------------
DROP TABLE IF EXISTS `specialist`;
CREATE TABLE `specialist` (
  `specialist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specialist_name` varchar(45) NOT NULL,
  `specialist_qualification` varchar(45) NOT NULL,
  `specialist_speialty` varchar(45) NOT NULL,
  `specialist_address` varchar(45) NOT NULL,
  `specialist_contact_no` varchar(45) NOT NULL,
  `specialist_gender` varchar(45) NOT NULL,
  `specialist_email` varchar(45) NOT NULL,
  `indoor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`specialist_id`),
  KEY `FK_specialist_indoor_id` (`indoor_id`),
  CONSTRAINT `FK_specialist_indoor_id` FOREIGN KEY (`indoor_id`) REFERENCES `indoor` (`indoor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------

-- ----------------------------
-- Trigger structure for patient_before_delete
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `patient_before_delete` BEFORE DELETE ON `patient` FOR EACH ROW BEGIN
insert into released_patient
set action = 'delete',
released_date = now(),
old_patient_id = old.patient_id,
old_patient_name = old.patient_name,
old_patient_address = old.patient_address,
old_patient_age = old.patient_age,
old_patient_contact_no = old.patient_contact_no,
old_patient_email = old.patient_email,
old_patient_gender = old.patient_gender;

END;;
DELIMITER ;
