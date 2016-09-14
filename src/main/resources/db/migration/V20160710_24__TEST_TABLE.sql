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

DROP TABLE IF EXISTS `jhac_saas`;
CREATE TABLE `jhac_saas` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT,
  `s_network` char(10) DEFAULT NULL,
  `s_begin_date` datetime DEFAULT NULL,
  `s_expire_date` datetime DEFAULT NULL,
  `s_status` char(1) DEFAULT '0' COMMENT '0:正常  1：已删除',
  `s_create_time` datetime DEFAULT NULL,
  `s_create_id` int(10) DEFAULT NULL,
  `s_update_time` datetime DEFAULT NULL,
  `s_update_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jhac_saas_log
-- ----------------------------
DROP TABLE IF EXISTS `jhac_saas_log`;
CREATE TABLE `jhac_saas_log` (
  `sl_id` int(10) NOT NULL,
  `sl_saas_id` int(10) DEFAULT NULL,
  `sl_new_begindate` datetime DEFAULT NULL,
  `sl_old_expiredate` datetime DEFAULT NULL,
  `sl_new_expiredate` datetime DEFAULT NULL,
  `sl_status` char(1) DEFAULT '0' COMMENT '0:正常 1：删除',
  `sl_create_id` int(10) DEFAULT NULL,
  `sl_create_time` datetime DEFAULT NULL,
  `sl_update_id` int(10) DEFAULT NULL,
  `sl_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
