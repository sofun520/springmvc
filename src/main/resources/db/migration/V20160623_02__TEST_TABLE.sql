/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-05-03 10:17:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jhac_enum
-- ----------------------------
DROP TABLE IF EXISTS `jhac_enum`;
CREATE TABLE `jhac_enum` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `enum_key` varchar(32) DEFAULT NULL,
  `enum_value` varchar(50) DEFAULT NULL,
  `enum_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_enum
-- ----------------------------
INSERT INTO `jhac_enum` VALUES ('1', '0', '男', 'ENUM001');
INSERT INTO `jhac_enum` VALUES ('2', '1', '女', 'ENUM001');
INSERT INTO `jhac_enum` VALUES ('3', '0', '总经办', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('4', '1', '财务部', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('5', '2', '销售部', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('6', '3', '区域网点', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('7', '4', '总公司仓库', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('8', '0', '高中及以下', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('9', '1', '大学专科', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('10', '2', '大学本科', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('11', '3', '研究生', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('12', '4', '博士生', 'ENUM003');

-- ----------------------------
-- Table structure for jhac_network
-- ----------------------------
DROP TABLE IF EXISTS `jhac_network`;
CREATE TABLE `jhac_network` (
  `n_id` int(10) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(50) DEFAULT NULL,
  `n_code` varchar(10) DEFAULT NULL,
  `n_leader` varchar(50) DEFAULT NULL,
  `n_leader_telphone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_network
-- ----------------------------

-- ----------------------------
-- Table structure for jhac_user
-- ----------------------------
DROP TABLE IF EXISTS `jhac_user`;
CREATE TABLE `jhac_user` (
  `u_id` int(10) NOT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_password` varchar(32) DEFAULT NULL,
  `u_truename` varchar(50) DEFAULT NULL,
  `u_telephone` varchar(11) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_role_id` int(10) DEFAULT NULL,
  `u_lastlogin_time` datetime DEFAULT NULL,
  `u_register_time` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_user
-- ----------------------------

-- ----------------------------
-- Table structure for jhac_user_info
-- ----------------------------
DROP TABLE IF EXISTS `jhac_user_info`;
CREATE TABLE `jhac_user_info` (
  `ui_id` int(10) NOT NULL,
  `ui_user_id` int(10) DEFAULT NULL,
  `ui_birthday` varchar(20) DEFAULT NULL,
  `ui_sex` char(2) DEFAULT NULL,
  `ui_entry_date` datetime DEFAULT NULL,
  `ui_department` varchar(40) DEFAULT NULL,
  `ui_leader` varchar(40) DEFAULT NULL,
  `ui_job` varchar(40) DEFAULT NULL,
  `ui_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ui_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
