/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2015-04-09 16:03:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL COMMENT 'id，同时也是编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `detail` varchar(500) DEFAULT NULL COMMENT '详情',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='item表';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', 'new2 - 阿尔卡特 (OT-927) 炭黑 联通3G手机 双卡双待', '清仓！仅北京，武汉仓有货！', '2015-03-08 21:33:18', '2015-04-11 20:38:38');
INSERT INTO `item` VALUES ('2', 'new8- 三星 W999 黑色 电信3G手机 双卡双待双通', '下单送12000毫安移动电源！双3.5英寸魔焕炫屏，以非凡视野纵观天下时局，尊崇翻盖设计，张弛中，尽显从容气度！', '2015-03-08 21:27:54', '2015-04-12 17:10:43');
INSERT INTO `item` VALUES ('3', '三星 B9120 钛灰色 联通3G手机 双卡双待双通', '下单即送10400毫安移动电源！再赠手机魔法盒！',  '2015-03-08 21:29:27', '2015-03-08 21:29:27');
INSERT INTO `item` VALUES ('4', '三星 Note II (N7100) 云石白 联通3G手机', '经典回顾！超值价格值得拥有。', '2015-03-08 21:28:16', '2015-03-08 21:28:16');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '13488888888', 'aa@a.cn', '2015-04-06 17:03:55', '2015-04-06 17:03:55');
INSERT INTO `user` VALUES ('2', 'zhangsan', 'password', '12344444444', null, '2015-06-19 10:02:11', '2015-06-19 10:02:11');
INSERT INTO `user` VALUES ('3', 'lisi', 'password', '13600112243', null, '2015-07-30 17:26:25', '2015-07-30 17:26:25');
INSERT INTO `user` VALUES ('4', 'wangmazi', 'password', '15866777744', '', '2015-08-01 11:48:42', '2015-08-01 11:48:42');