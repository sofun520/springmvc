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

DROP TABLE IF EXISTS `jhac_product_class`;
CREATE TABLE `jhac_product_class` (
  `pc_id` int(10) NOT NULL AUTO_INCREMENT,
  `pc_name` varchar(30) DEFAULT NULL,
  `pc_xinghao` varchar(50) DEFAULT NULL,
  `pc_price` decimal(2,0) DEFAULT NULL,
  `pc_status` char(1) DEFAULT '0' COMMENT '数据状态 0：正常 1：删除',
  `pc_create_id` int(10) DEFAULT NULL,
  `pc_create_date` datetime DEFAULT NULL,
  `pc_update_id` int(10) DEFAULT NULL,
  `pc_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;