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

DROP TABLE IF EXISTS `max_code`;
CREATE TABLE `max_code` (
  `name` varchar(10) DEFAULT NULL,
  `max` int(5) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



create PROCEDURE test(in prefix char(2),out xcode VARCHAR(13))
BEGIN

DECLARE now_date VARCHAR(8);
DECLARE max_code INT;

#查询今天的时间转成字符串
select DATE_FORMAT(now(),'%Y%m%d') into now_date from dual;

#查询max_code
select max into max_code from max_code where name=prefix and date = now_date;

#如果max_code为空
if max_code is null then

    INSERT into max_code (name,max,date) values (prefix,1,now_date);

#不为空
ELSE
    update max_code set max = max_code+1 where name=prefix and date = now_date;

end if;

    select max into max_code from max_code where name=prefix and date = now_date;
    select concat(prefix,now_date,LPAD((max_code), 3, '0')) as code into xcode;

END
