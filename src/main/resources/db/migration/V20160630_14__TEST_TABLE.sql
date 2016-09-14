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

DROP TABLE IF EXISTS `jhac_product`;
CREATE TABLE `jhac_product` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) DEFAULT NULL,
  `p_serialno` varchar(30) DEFAULT NULL,
  `p_class` int(10) DEFAULT NULL,
  `p_use` char(1) DEFAULT '0' COMMENT '是否使用 1：使用 0 ：未使用',
  `p_status` char(1) DEFAULT '0' COMMENT '0：未删除 1：已删除',
  `p_network` varchar(10) DEFAULT NULL,
  `p_remark` varchar(30) DEFAULT NULL,
  `p_create_id` int(10) DEFAULT NULL,
  `p_create_time` datetime DEFAULT NULL,
  `p_update_id` int(10) DEFAULT NULL,
  `p_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;