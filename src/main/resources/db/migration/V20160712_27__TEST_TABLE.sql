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

ALTER table jhac_saas_log add sl_review_id int(10);
ALTER table jhac_saas_log add sl_review_result char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '审核结果 1：通过  0：不通过';
ALTER table jhac_saas_log add sl_review_reason varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;