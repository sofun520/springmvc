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

DROP TABLE IF EXISTS `jhac_company`;
CREATE TABLE `jhac_company` (
  `com_id` int(10) NOT NULL AUTO_INCREMENT,
  `com_name` varchar(50) DEFAULT NULL,
  `com_group_id` int(10) DEFAULT NULL,
  `com_network_code` varchar(10) DEFAULT NULL,
  `com_status` char(1) DEFAULT '0' COMMENT '数据状态 0：启用、1：删除',
  `com_add_id` int(10) DEFAULT NULL COMMENT '添加人id',
  `com_update_id` int(10) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_company
-- ----------------------------

-- ----------------------------
-- Table structure for jhac_group
-- ----------------------------
DROP TABLE IF EXISTS `jhac_group`;
CREATE TABLE `jhac_group` (
  `g_id` int(10) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(50) DEFAULT NULL,
  `g_status` char(1) DEFAULT '0' COMMENT '数据状态 0:启用、1：删除',
  `g_add_id` int(10) DEFAULT NULL COMMENT '添加人id',
  `g_update_id` int(10) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
