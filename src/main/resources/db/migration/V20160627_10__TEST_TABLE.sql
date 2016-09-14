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

DROP TABLE IF EXISTS `jhac_carclass`;
CREATE TABLE `jhac_carclass` (
  `cc_id` int(10) NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(30) DEFAULT NULL,
  `cc_com_id` int(10) DEFAULT NULL,
  `cc_status` char(1) DEFAULT '0' COMMENT '数据状态 0：启用 1：删除',
  `cc_create_id` int(10) DEFAULT NULL,
  `cc_create_time` datetime DEFAULT NULL,
  `cc_update_id` int(10) DEFAULT NULL,
  `cc_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;