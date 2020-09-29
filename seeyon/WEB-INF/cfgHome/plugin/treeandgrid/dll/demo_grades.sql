/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : v71sp19m

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2020-06-08 15:44:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for demo_grades
-- ----------------------------
DROP TABLE IF EXISTS `demo_grades`;
CREATE TABLE `demo_grades` (
  `id` bigint(22) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `stype` varchar(50) DEFAULT NULL,
  `pid` bigint(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
