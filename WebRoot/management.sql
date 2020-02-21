/*
Navicat MySQL Data Transfer

Source Server         : ldn
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : management

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-05-07 11:38:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL auto_increment,
  `username` varchar(28) default NULL,
  `adminpwd` varchar(28) default NULL,
  `adminname` varchar(28) default NULL,
  PRIMARY KEY  (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `msgid` int(11) NOT NULL auto_increment,
  `title` varchar(28) default NULL,
  `content` text,
  `addtime` varchar(28) default NULL,
  `studentid` int(11) default NULL,
  `teacherid` int(11) default NULL,
  `replycontent` text,
  `replytime` varchar(255) default NULL,
  PRIMARY KEY  (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentid` int(11) NOT NULL auto_increment,
  `studentname` varchar(28) default NULL,
  `sno` varchar(28) default NULL,
  `studentpwd` int(11) default NULL,
  `major` varchar(28) default NULL,
  `xb` varchar(28) default NULL,
  `sex` varchar(6) default NULL,
  PRIMARY KEY  (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherid` int(11) NOT NULL auto_increment,
  `teachername` varchar(28) default NULL,
  `gno` varchar(28) default NULL,
  `teacherpwd` int(11) default NULL,
  `sex` varchar(6) default NULL,
  PRIMARY KEY  (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `testid` int(11) NOT NULL,
  `testurl` varchar(28) default NULL,
  `testmajor` text,
  `testtitle` varchar(28) default NULL,
  PRIMARY KEY  (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `videoid` int(11) NOT NULL,
  `videourl` varchar(28) default NULL,
  `videomajor` varchar(28) default NULL,
  `videoname` varchar(28) default NULL,
  PRIMARY KEY  (`videoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
