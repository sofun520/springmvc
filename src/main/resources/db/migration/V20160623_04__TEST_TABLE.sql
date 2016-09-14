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

UPDATE `menu` SET `menu_id`='6', `menu_name`='合作商信息管理', `menu_url`='company/query.do', `menu_parent`='1' WHERE (`menu_id`='6');
UPDATE `menu` SET `menu_id`='7', `menu_name`='车辆类别管理', `menu_url`='carclass/query.do', `menu_parent`='1' WHERE (`menu_id`='7');
UPDATE `menu` SET `menu_id`='8', `menu_name`='用户信息管理', `menu_url`='userinfo/query.do', `menu_parent`='1' WHERE (`menu_id`='8');
UPDATE `menu` SET `menu_id`='9', `menu_name`='装车记录管理', `menu_url`='outinfo/query.do', `menu_parent`='2' WHERE (`menu_id`='9');
UPDATE `menu` SET `menu_id`='10', `menu_name`='客户信息管理', `menu_url`='customer/query.do', `menu_parent`='2' WHERE (`menu_id`='10');
UPDATE `menu` SET `menu_id`='11', `menu_name`='车辆信息管理', `menu_url`='carinfo/query.do', `menu_parent`='2' WHERE (`menu_id`='11');
UPDATE `menu` SET `menu_id`='12', `menu_name`='售后信息管理', `menu_url`='backservice/query.do', `menu_parent`='2' WHERE (`menu_id`='12');
UPDATE `menu` SET `menu_id`='13', `menu_name`='回访信息管理', `menu_url`='turnvisit/query.do', `menu_parent`='2' WHERE (`menu_id`='13');
UPDATE `menu` SET `menu_id`='14', `menu_name`='未装车货品列表', `menu_url`='productUseless/query.do', `menu_parent`='3' WHERE (`menu_id`='14');
UPDATE `menu` SET `menu_id`='15', `menu_name`='货物信息管理(总公司)', `menu_url`='productCorporation/query.do', `menu_parent`='3' WHERE (`menu_id`='15');
UPDATE `menu` SET `menu_id`='16', `menu_name`='货物信息管理(区域)', `menu_url`='productLocal/query.do', `menu_parent`='3' WHERE (`menu_id`='16');
UPDATE `menu` SET `menu_id`='17', `menu_name`='SAAS服务管理(总公司)', `menu_url`='saasCorporation/query.do', `menu_parent`='4' WHERE (`menu_id`='17');
UPDATE `menu` SET `menu_id`='18', `menu_name`='SAAS服务管理(区域)', `menu_url`='saasLocal/query.do', `menu_parent`='4' WHERE (`menu_id`='18');
UPDATE `menu` SET `menu_id`='19', `menu_name`='报表业务(总公司)', `menu_url`='reportCorporation/query.do', `menu_parent`='5' WHERE (`menu_id`='19');
UPDATE `menu` SET `menu_id`='20', `menu_name`='报表业务(区域)', `menu_url`='reportLocal/query.do', `menu_parent`='5' WHERE (`menu_id`='20');

INSERT INTO `jhac_user` (`u_id`, `u_name`, `u_password`, `u_truename`, `u_telephone`, `u_email`, `u_role_id`, `u_lastlogin_time`, `u_register_time`) VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '测试', '18694054311', '402864040@qq.com', '2', '2016-06-23 21:36:10', '2016-06-23 21:36:14');

