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

ALTER TABLE jhac_user modify u_id int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE jhac_user_info modify ui_id int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE jhac_user_info modify ui_entry_date date;

