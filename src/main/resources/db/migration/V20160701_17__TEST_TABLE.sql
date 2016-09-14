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

DROP TABLE IF EXISTS `jhac_order`;
CREATE TABLE `jhac_order` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `o_name` varchar(40) DEFAULT NULL COMMENT '订单名称',
  `o_code` varchar(30) DEFAULT NULL COMMENT '订单编号(流水号)',
  `o_status` char(1) DEFAULT '0' COMMENT '订单状态 0：已申请，未处理 1：处理中  2：发货中 3：订单完成  4：删除',
  `o_network` varchar(10) DEFAULT NULL,
  `o_create_id` int(10) DEFAULT NULL COMMENT '订货人',
  `o_create_time` datetime DEFAULT NULL COMMENT '订货时间',
  `o_update_id` int(10) DEFAULT NULL COMMENT '处理人',
  `o_update_time` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;