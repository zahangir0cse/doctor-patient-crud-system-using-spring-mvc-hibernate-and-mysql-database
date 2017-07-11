/*
MySQL Data Transfer
Source Host: localhost
Source Database: restful_in_peace
Target Host: localhost
Target Database: restful_in_peace
Date: 2017-07-12 05.23.01
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indoor
-- ----------------------------
DROP TABLE IF EXISTS `indoor`;
CREATE TABLE `indoor` (
  `indoor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indoor_department` varchar(45) NOT NULL,
  `admission_id` int(10) unsigned NOT NULL,
  `specialist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`indoor_id`),
  KEY `FK_indoor_admission_id` (`admission_id`),
  KEY `FK_indoor_specialist_id` (`specialist_id`),
  CONSTRAINT `FK_indoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FK_indoor_specialist_id` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`specialist_id`)
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
  PRIMARY KEY (`mi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for outdoor
-- ----------------------------
DROP TABLE IF EXISTS `outdoor`;
CREATE TABLE `outdoor` (
  `outdoor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` int(10) unsigned NOT NULL,
  `mi_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`outdoor_id`),
  KEY `FK_outdoor_admission_id` (`admission_id`),
  KEY `FK_outdoor_mi_id` (`mi_id`),
  CONSTRAINT `FK_outdoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FK_outdoor_mi_id` FOREIGN KEY (`mi_id`) REFERENCES `mi` (`mi_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`specialist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admission` VALUES ('1', '1', '2017-07-10');
INSERT INTO `admission` VALUES ('2', '2', '2017-07-10');
INSERT INTO `admission` VALUES ('3', '3', '2017-07-10');
INSERT INTO `admission` VALUES ('4', '4', '2017-07-11');
INSERT INTO `admission` VALUES ('5', '5', '2017-07-11');
INSERT INTO `admission` VALUES ('8', '8', '2017-07-11');
INSERT INTO `admission` VALUES ('10', '10', '2017-07-11');
INSERT INTO `admission` VALUES ('11', '11', '2017-07-11');
INSERT INTO `admission` VALUES ('12', '12', '2017-07-11');
INSERT INTO `admission` VALUES ('13', '13', '2017-07-11');
INSERT INTO `admission` VALUES ('14', '14', '2017-07-11');
INSERT INTO `mi` VALUES ('1', 'mi1', 'MBBS', 'Dhaka', 'Male', '03893232892', 'mi1@mi.com');
INSERT INTO `patient` VALUES ('1', 'Abc', '23', 'Male', 'Dhaka', '01677700090', 'abc@abc.com');
INSERT INTO `patient` VALUES ('2', 'Abc', '23', 'Male', 'Dhaka', '01677700090', 'abc@abc.com');
INSERT INTO `patient` VALUES ('3', 'Abc2', '12', 'Male', 'Dhaka', '01677700091', 'abc2@abc.com');
INSERT INTO `patient` VALUES ('4', 'Abc4', '43', 'Male', 'Dhaka', '01677700094', 'abc4@abc.com');
INSERT INTO `patient` VALUES ('5', 'Abc4', '43', 'Male', 'Dhaka', '01677700094', 'abc4@abc.com');
INSERT INTO `patient` VALUES ('8', 'Abc4', '0', 'Male', 'Dhaka', '01677700090', 'abc@abc.com');
INSERT INTO `patient` VALUES ('10', 'Abc4', '44', 'Male', 'Dhaka', '01677700090', 'abc2@abc.com');
INSERT INTO `patient` VALUES ('11', 'Abc', '12', 'Female', 'Dhaka', '01677700090', 'abc2@abc.com');
INSERT INTO `patient` VALUES ('12', 'Habib', '27', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('13', 'Maruf', '27', 'Male', 'Dhaka', '01677700090', 'maruf@gmail.com');
INSERT INTO `patient` VALUES ('14', 'Mahmud', '20', 'Male', 'Dhaka', '01677700090', 'mahmud@gmail.com');
INSERT INTO `released_patient` VALUES ('2', '2017-07-12', '7', 'Abc4', 'Dhaka', '22', '01677700090', 'abc2@abc.com', 'Male', 'delete');
INSERT INTO `released_patient` VALUES ('3', '2017-07-12', '9', 'Abc4', 'Dhaka', '22', '01677700091', 'abc@abc.com', 'Female', 'delete');
INSERT INTO `released_patient` VALUES ('4', '2017-07-12', '6', 'Abc4', 'Dhaka', '43', '01677700094', 'abc4@abc.com', 'Male', 'delete');
INSERT INTO `specialist` VALUES ('1', 'xyz', 'PhD', 'Pharmacist', 'Dhaka', '8272881189', 'Male', 'xyz@xzy.com');

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
