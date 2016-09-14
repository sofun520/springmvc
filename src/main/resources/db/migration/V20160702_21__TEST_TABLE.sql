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

DROP TABLE IF EXISTS `jhac_order_detail`;
CREATE TABLE `jhac_order_detail` (
  `od_id` int(10) NOT NULL AUTO_INCREMENT,
  `od_order_id` varchar(30) DEFAULT NULL,
  `od_pc_id` int(10) DEFAULT NULL,
  `od_number` int(100) DEFAULT NULL,
  `od_status` char(1) DEFAULT '0' COMMENT '数据状态 0：正常 1：删除',
  `od_create_id` int(10) DEFAULT NULL,
  `od_create_time` datetime DEFAULT NULL,
  `od_update_id` int(10) DEFAULT NULL,
  `od_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;