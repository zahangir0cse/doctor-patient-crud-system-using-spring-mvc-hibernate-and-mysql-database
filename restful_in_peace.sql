/*
MySQL Data Transfer
Source Host: localhost
Source Database: restful_in_peace
Target Host: localhost
Target Database: restful_in_peace
Date: 2017-07-12 18.52.26
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indoor
-- ----------------------------
DROP TABLE IF EXISTS `indoor`;
CREATE TABLE `indoor` (
  `indoor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indoor_department` varchar(45) NOT NULL,
  `admission_id` int(10) unsigned NOT NULL,
  `specialist_id` int(10) unsigned NOT NULL,
  `indoor_type` varchar(45) NOT NULL,
  PRIMARY KEY (`indoor_id`),
  KEY `FK_indoor_admission_id` (`admission_id`),
  KEY `FK_indoor_specialist_id` (`specialist_id`),
  CONSTRAINT `FK_indoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FK_indoor_specialist_id` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`specialist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `mi_time` varchar(45) NOT NULL,
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
  `outdoor_time` varchar(45) NOT NULL,
  PRIMARY KEY (`outdoor_id`),
  KEY `FK_outdoor_admission_id` (`admission_id`),
  KEY `FK_outdoor_mi_id` (`mi_id`),
  CONSTRAINT `FK_outdoor_admission_id` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`admission_id`),
  CONSTRAINT `FK_outdoor_mi_id` FOREIGN KEY (`mi_id`) REFERENCES `mi` (`mi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`specialist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admission` VALUES ('16', '16', '2017-07-12');
INSERT INTO `admission` VALUES ('17', '17', '2017-07-12');
INSERT INTO `admission` VALUES ('18', '18', '2017-07-12');
INSERT INTO `admission` VALUES ('19', '19', '2017-07-12');
INSERT INTO `admission` VALUES ('20', '20', '2017-07-12');
INSERT INTO `admission` VALUES ('21', '21', '2017-07-12');
INSERT INTO `admission` VALUES ('22', '22', '2017-07-12');
INSERT INTO `admission` VALUES ('23', '23', '2017-07-12');
INSERT INTO `indoor` VALUES ('1', 'Surgery-General', '16', '2', 'PRIVATE ROOM');
INSERT INTO `mi` VALUES ('1', 'mi1', 'MBBS', 'Dhaka', 'Male', '03893232892', 'mi1@mi.com', '2 to 7 pm');
INSERT INTO `outdoor` VALUES ('1', '23', '1', '2 to 7 pm');
INSERT INTO `patient` VALUES ('16', 'Mahmud', '18', 'Male', 'Dhaka', '01730277223', 'aanniiss112233@gmail.com');
INSERT INTO `patient` VALUES ('17', 'Habib', '27', 'Male', 'Dhaka', '01677700094', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('18', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('19', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('20', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('21', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('22', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('23', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `specialist` VALUES ('1', 'xyz', 'PhD', 'Pharmacist', 'Dhaka', '8272881189', 'Male', 'xyz@xzy.com');
INSERT INTO `specialist` VALUES ('2', 'Rajib Ahmed', 'PhD', 'Surgery-General', 'Dhaka, Bangladesh', '01677000000', 'Male', 'rajib@gmail.com');
INSERT INTO `specialist` VALUES ('3', 'Hasan Ahmed', 'PhD', 'Radiation Oncology', 'Dhaka, Bangladesh', '01677000001', 'Male', 'hasan@gmail.com');
INSERT INTO `specialist` VALUES ('4', 'Shahidur Alam', 'PhD', 'Dermatology', 'Dhaka, Bangladesh', '01677000002', 'Male', 'shahid@gmail.com');
INSERT INTO `specialist` VALUES ('5', 'Hamidur Rahaman', 'PhD', 'Pain Medicine', 'Dhaka, Bangladesh', '01677000003', 'Male', 'hamidur@gmail.com');
INSERT INTO `specialist` VALUES ('6', 'Rashedul Kabir', 'PhD', 'Abdominal Radiology', 'Dhaka, Bangladesh', '01677000004', 'Male', 'rashedul@gmail.com');

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
