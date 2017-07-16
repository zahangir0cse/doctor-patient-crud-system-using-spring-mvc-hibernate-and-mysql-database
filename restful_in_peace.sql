/*
MySQL Data Transfer
Source Host: localhost
Source Database: restful_in_peace
Target Host: localhost
Target Database: restful_in_peace
Date: 2017-07-17 00.06.34
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_role` varchar(45) NOT NULL,
  `user_contact_no` varchar(45) NOT NULL,
  `user_address` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admission` VALUES ('16', '16', '2017-07-12');
INSERT INTO `admission` VALUES ('17', '17', '2017-07-12');
INSERT INTO `admission` VALUES ('18', '18', '2017-07-12');
INSERT INTO `admission` VALUES ('19', '19', '2017-07-12');
INSERT INTO `admission` VALUES ('20', '20', '2017-07-12');
INSERT INTO `admission` VALUES ('22', '22', '2017-07-15');
INSERT INTO `admission` VALUES ('23', '23', '2017-07-15');
INSERT INTO `admission` VALUES ('24', '24', '2017-07-15');
INSERT INTO `admission` VALUES ('25', '25', '2017-07-17');
INSERT INTO `indoor` VALUES ('1', 'Surgery-General', '16', '2', 'PRIVATE ROOM');
INSERT INTO `indoor` VALUES ('2', 'Surgery-General', '22', '2', 'GENERAL WARD');
INSERT INTO `indoor` VALUES ('3', 'Surgery-General', '25', '2', 'GENERAL WARD');
INSERT INTO `mi` VALUES ('1', 'mi1', 'MBBS', 'Dhaka', 'Male', '03893232892', 'mi1@mi.com', '2 to 7 pm');
INSERT INTO `outdoor` VALUES ('1', '23', '1', '2 to 7 pm');
INSERT INTO `outdoor` VALUES ('2', '25', '1', '2 to 7 pm');
INSERT INTO `patient` VALUES ('16', 'Mahmud', '18', 'Male', 'Dhaka', '01730277223', 'aanniiss112233@gmail.com');
INSERT INTO `patient` VALUES ('17', 'Habib', '27', 'Male', 'Dhaka', '01677700094', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('18', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('19', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('20', 'Habib', '22', 'Male', 'Dhaka', '01677700090', 'habib@gmail.com');
INSERT INTO `patient` VALUES ('22', 'abc', '22', 'Female', 'Dhaka', '01677700090', 'abc@abc.com');
INSERT INTO `patient` VALUES ('23', 'abc', '22', 'Female', 'Dhaka', '01677700090', 'abc@abc.com');
INSERT INTO `patient` VALUES ('24', 'Mokul', '18', 'Male', 'Dhaka', '01677495770', 'mokul@gmail.com');
INSERT INTO `patient` VALUES ('25', 'Habib', '11', 'Male', 'Dhaka', '01677700091', 'habib@gmail.com');
INSERT INTO `released_patient` VALUES ('16', '2017-07-13', '23', 'Habib', 'Dhaka', '22', '01677700090', 'habib@gmail.com', 'Male', 'delete');
INSERT INTO `released_patient` VALUES ('17', '2017-07-13', '22', 'Habib', 'Dhaka', '22', '01677700090', 'habib@gmail.com', 'Male', 'delete');
INSERT INTO `released_patient` VALUES ('18', '2017-07-13', '21', 'Habib', 'Dhaka', '22', '01677700090', 'habib@gmail.com', 'Male', 'delete');
INSERT INTO `released_patient` VALUES ('19', '2017-07-15', '21', 'abc', 'Dhaka', '22', '01677700090', 'abc@abc.com', 'Female', 'delete');
INSERT INTO `specialist` VALUES ('1', 'Tawfiq', 'PhD', 'Pharmacist', 'Dhaka', '8272881189', 'Male', 'tawfiq@xzy.com');
INSERT INTO `specialist` VALUES ('2', 'Rajib Ahmed', 'MBBS', 'Surgery-General', 'Dhaka, Bangladesh', '01677000000', 'Male', 'rajib@gmail.com');
INSERT INTO `specialist` VALUES ('3', 'Hasan Ahmed', 'PhD', 'Radiation Oncology', 'Dhaka, Bangladesh', '01677000001', 'Male', 'hasan@gmail.com');
INSERT INTO `user` VALUES ('1', 'Zahangir', '1234Zah', 'zahangir0cse@gmail.com', 'admin', '01677495779', 'Dhaka');
INSERT INTO `user` VALUES ('6', 'Ragib', '1234rajib', 'rajib@gmail.com', 'specialist', '01677495770', 'Dhaka');
INSERT INTO `user` VALUES ('7', 'kamal', '1234kaman', 'kamal@gmail.com', 'specialist', '01677495779', 'Dhaka');

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
