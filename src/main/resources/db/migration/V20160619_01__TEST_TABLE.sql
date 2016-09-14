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
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `jhac_admin`;
CREATE TABLE `jhac_admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(40) DEFAULT NULL,
  `admin_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_admin
-- ----------------------------
INSERT INTO `jhac_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `menu_parent` int(10) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '基础数据管理', 'basedata.do', null);
INSERT INTO `menu` VALUES ('2', '装车业务管理', 'outmanage.do', null);
INSERT INTO `menu` VALUES ('3', '货品管理', 'product.do', null);
INSERT INTO `menu` VALUES ('4', 'SAAS服务管理', 'saasservice.do', null);
INSERT INTO `menu` VALUES ('5', '报表服务', 'report.do', null);
INSERT INTO `menu` VALUES ('6', '合作商信息管理', 'company.do', '1');
INSERT INTO `menu` VALUES ('7', '车辆类别管理', 'carclass.do', '1');
INSERT INTO `menu` VALUES ('8', '用户信息管理', 'userinfo.do', '2');
INSERT INTO `menu` VALUES ('9', '装车记录管理', 'outinfo.do', '2');
INSERT INTO `menu` VALUES ('10', '客户信息管理', 'customer.do', '2');
INSERT INTO `menu` VALUES ('11', '车辆信息管理', 'carinfo.do', '2');
INSERT INTO `menu` VALUES ('12', '售后信息管理', 'backservice.do', '2');
INSERT INTO `menu` VALUES ('13', '回访信息管理', 'turnvisit.do', '2');
INSERT INTO `menu` VALUES ('14', '未装车货品列表', 'productUseless.do', '3');
INSERT INTO `menu` VALUES ('15', '货物信息管理(总公司)', 'productCorporation.do', '3');
INSERT INTO `menu` VALUES ('16', '货物信息管理(区域)', 'productLocal.do', '3');
INSERT INTO `menu` VALUES ('17', 'SAAS服务管理(总公司)', 'saasCorporation.do', '4');
INSERT INTO `menu` VALUES ('18', 'SAAS服务管理(区域)', 'saasLocal.do', '4');
INSERT INTO `menu` VALUES ('19', '报表业务(总公司)', 'reportCorporation.do', '5');
INSERT INTO `menu` VALUES ('20', '报表业务(区域)', 'reportLocal.do', '5');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '总经理');
INSERT INTO `role` VALUES ('2', '区域总监');
INSERT INTO `role` VALUES ('3', '仓库管理员(总公司)');
INSERT INTO `role` VALUES ('4', '员工(总公司)');
INSERT INTO `role` VALUES ('5', '员工(区域)');
INSERT INTO `role` VALUES ('6', '运维人员(总公司)');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `rm_id` int(10) NOT NULL AUTO_INCREMENT,
  `rm_role_id` int(10) DEFAULT NULL,
  `rm_menu_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '3', '3');
INSERT INTO `role_menu` VALUES ('2', '3', '15');
INSERT INTO `role_menu` VALUES ('3', '6', '4');
INSERT INTO `role_menu` VALUES ('4', '6', '17');
INSERT INTO `role_menu` VALUES ('5', '2', '1');
INSERT INTO `role_menu` VALUES ('6', '2', '2');
INSERT INTO `role_menu` VALUES ('7', '2', '3');
INSERT INTO `role_menu` VALUES ('8', '2', '4');
INSERT INTO `role_menu` VALUES ('9', '2', '5');
INSERT INTO `role_menu` VALUES ('10', '2', '6');
INSERT INTO `role_menu` VALUES ('11', '2', '7');
INSERT INTO `role_menu` VALUES ('12', '2', '8');
INSERT INTO `role_menu` VALUES ('13', '2', '9');
INSERT INTO `role_menu` VALUES ('14', '2', '10');
INSERT INTO `role_menu` VALUES ('15', '2', '11');
INSERT INTO `role_menu` VALUES ('16', '2', '12');
INSERT INTO `role_menu` VALUES ('17', '2', '13');
INSERT INTO `role_menu` VALUES ('18', '2', '16');
INSERT INTO `role_menu` VALUES ('19', '2', '18');
INSERT INTO `role_menu` VALUES ('20', '2', '20');
INSERT INTO `role_menu` VALUES ('21', '1', '5');
INSERT INTO `role_menu` VALUES ('22', '1', '6');
INSERT INTO `role_menu` VALUES ('23', '1', '19');