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

DROP TABLE IF EXISTS `jhac_backservice`;
CREATE TABLE `jhac_backservice` (
  `bc_id` int(10) NOT NULL AUTO_INCREMENT,
  `bc_out_id` int(10) DEFAULT NULL,
  `bc_fault` varchar(50) DEFAULT NULL COMMENT '故障描述',
  `bc_resolvent` varchar(100) DEFAULT NULL COMMENT '解决方法',
  `bc_status` char(1) DEFAULT NULL COMMENT '数据状态：0-可用 1-删除',
  `bc_network` varchar(10) DEFAULT NULL,
  `bc_resolve_id` int(10) DEFAULT NULL,
  `bc_resolve_time` datetime DEFAULT NULL,
  `bc_create_id` int(10) DEFAULT NULL,
  `bc_create_date` datetime DEFAULT NULL,
  `bc_update_id` int(10) DEFAULT NULL,
  `bc_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`bc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jhac_car
-- ----------------------------
DROP TABLE IF EXISTS `jhac_car`;
CREATE TABLE `jhac_car` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `c_changpai` varchar(50) DEFAULT NULL COMMENT '厂牌',
  `c_xinghao` varchar(50) DEFAULT NULL COMMENT '型号',
  `c_dengjidate` varchar(30) DEFAULT NULL COMMENT '首次登记日期',
  `c_licence` varchar(50) DEFAULT NULL COMMENT '车牌号',
  `c_engineno` varchar(50) DEFAULT NULL COMMENT '发动机号',
  `c_color` varchar(20) DEFAULT NULL COMMENT '车身颜色',
  `c_gear` varchar(20) DEFAULT NULL COMMENT '自动/手动',
  `c_out_id` varchar(32) DEFAULT NULL COMMENT '装车信息ID',
  `c_status` char(1) DEFAULT '0' COMMENT '数据状态：0-可用、1-删除',
  `c_create_time` datetime DEFAULT NULL COMMENT '录入日期',
  `c_create_id` int(10) DEFAULT NULL,
  `c_update_time` datetime DEFAULT NULL,
  `c_update_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='车辆信息表';
