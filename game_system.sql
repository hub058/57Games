/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50149
Source Host           : localhost:3306
Source Database       : game_system

Target Server Type    : MYSQL
Target Server Version : 50149
File Encoding         : 65001

Date: 2018-03-23 14:42:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `money`
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', 'admin', '100');
INSERT INTO `money` VALUES ('2', 'admin', '100');
INSERT INTO `money` VALUES ('3', 'admin', '200');
INSERT INTO `money` VALUES ('4', 'admin', '100');

-- ----------------------------
-- Table structure for `note`
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `user` varchar(64) DEFAULT NULL COMMENT '发布人',
  `date` varchar(64) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('2', '新年快乐', '新年快乐', 'admin', '2018-02-18');
INSERT INTO `note` VALUES ('4', '111', '111', 'admin', '2018-02-27');
INSERT INTO `note` VALUES ('5', '222', '222', 'admin', '2018-02-27');
INSERT INTO `note` VALUES ('6', '333', '333', 'admin', '2018-02-27');
INSERT INTO `note` VALUES ('7', '444', '444', 'admin', '2018-02-27');
INSERT INTO `note` VALUES ('8', '555', '555', 'admin', '2018-02-27');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `pass` varchar(64) NOT NULL COMMENT '密码',
  `status` int(2) DEFAULT NULL COMMENT '角色',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `mail` char(100) NOT NULL COMMENT 'E-mail',
  `RealName` varchar(64) NOT NULL COMMENT '真实姓名',
  `IDnumber` char(100) NOT NULL COMMENT '身份证号',
  `TotalRecharge` int(255) DEFAULT NULL COMMENT '充值总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '3', '15503858931', '892088876@qq.com', '王明建', '411423199707136097', '400');
INSERT INTO `user` VALUES ('3', 'tom', '123456', '1', '13715235993', '2605800237@qq.com', '张西正', '411423199805215223', '400');
INSERT INTO `user` VALUES ('4', 'wang', '123', '1', '13715235993', '3329327707@qq.com', '李柯', '411423199902015624', null);
INSERT INTO `user` VALUES ('16', 'liu', '123456', '1', '15503858931', 'qq2605800237@qq.com', '张三', '411423199101032654', null);
