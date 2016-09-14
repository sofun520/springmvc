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

DROP TABLE IF EXISTS `jhac_customer`;
CREATE TABLE `jhac_customer` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(40) DEFAULT NULL,
  `c_identity` varchar(20) DEFAULT NULL,
  `c_telephone` varchar(20) DEFAULT NULL,
  `c_address` varchar(100) DEFAULT NULL,
  `c_out_id` int(10) DEFAULT NULL,
  `c_identity_img` varchar(32) DEFAULT NULL COMMENT '图片id，uuid',
  `c_status` char(1) DEFAULT '0',
  `c_create_id` int(10) DEFAULT NULL,
  `c_create_time` datetime DEFAULT NULL,
  `c_update_id` int(10) DEFAULT NULL,
  `c_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jhac_out
-- ----------------------------
DROP TABLE IF EXISTS `jhac_out`;
CREATE TABLE `jhac_out` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT,
  `o_car_class` int(10) DEFAULT NULL,
  `o_serialno` varchar(30) DEFAULT NULL,
  `o_frameno` varchar(30) DEFAULT NULL,
  `o_product_img` varchar(32) DEFAULT NULL,
  `o_is_check_car` char(1) DEFAULT '1',
  `o_is_test_car` char(1) DEFAULT '1',
  `o_is_sign` char(1) DEFAULT '1',
  `o_serialno_img` varchar(32) DEFAULT NULL,
  `o_frameno_img` varchar(32) DEFAULT NULL,
  `o_person` int(10) DEFAULT NULL,
  `o_address` int(10) DEFAULT NULL,
  `o_auth_telephone` varchar(30) DEFAULT NULL,
  `o_remark` varchar(50) DEFAULT NULL,
  `o_network` varchar(10) DEFAULT NULL,
  `o_status` char(1) DEFAULT '0' COMMENT '数据状态：0可用、1-删除',
  `o_create_id` int(10) DEFAULT NULL,
  `o_create_time` datetime DEFAULT NULL,
  `o_update_id` int(10) DEFAULT NULL,
  `o_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
