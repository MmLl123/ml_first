/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : weiboinfoluntankaoyan_ssm_new

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2021-05-05 11:33:43
*/

SET FOREIGN_KEY_CHECKS=0;
create database `weiboinfoluntankaoyan_ssm_new`;
use `weiboinfoluntankaoyan_ssm_new`;
-- ----------------------------
-- Table structure for wct_blog
-- ----------------------------
DROP TABLE IF EXISTS `wct_blog`;
CREATE TABLE `wct_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `btype` varchar(50) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `typecn` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `favcount` int(11) DEFAULT NULL,
  `zan` int(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `nm` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_blog
-- ----------------------------
INSERT INTO `wct_blog` VALUES ('47', '分享一个java教程', '<p>这里是详细的帖子内容</p><p><img src=\"upload/3903740d-1d1b-4b37-a9e2-6cbcd223ebaa.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"upload/d14cd4f4-0fed-4f3f-9b8d-2301c9cc1df7.jpg\" style=\"max-width:100%;\"><br></p>', '2021-04-29 10:13:31', '1', '62d11280-a8a8-4229-a8d6-2325f1795225.jpg', '1bdce82a-7403-4576-bc92-b0cea8e6a2c5.mp4', '64', '专业', '1', 'admin', '1', '5', '', null);
INSERT INTO `wct_blog` VALUES ('48', '分享一个考研题目', '<p>这里是发帖的详细内容</p><p><img src=\"http://192.168.31.207:8088/upload/cc5eb46e-206b-4ea1-8d4d-0b2c438f7338.jpg\" style=\"max-width:100%;\"/><br/></p>', '2021-04-17 14:24:11', '2', 'fbf492b5-dd81-4478-95b9-18588259555c.jpg', '', '61', '数学', '39', '小美', null, null, '', '0');
INSERT INTO `wct_blog` VALUES ('49', '英语专业考研技巧', '<h2 style=\"text-align: center;\"><span style=\"font-weight: bold;\">这里可以任意编辑的帖子的</span></h2><div><span style=\"font-weight: bold;\">我这里就不详细演示了,自己任意编辑,插入图片什么的都可以</span></div><div><img src=\"upload/b9603edf-d2fd-4211-b29c-eb1ef3dec9d2.jpg\" style=\"max-width:100%;\"><span style=\"font-weight: bold;\"><br></span></div><p><img src=\"upload/8f27f063-90ed-440b-8cfb-56310b239baf.jpeg\" style=\"max-width:100%;\"><br></p><p><br></p>', '2021-04-17 14:30:29', '1', '0cd00c9f-93a6-4258-b64e-110e23171b84.jpg', '', '62', '英语', '1', 'admin', '1', '1', '', null);
INSERT INTO `wct_blog` VALUES ('50', '分享一个考研技巧', '<p>同样的这里可以自己随意编</p>', '2021-04-17 14:32:39', '2', '2847cb5a-f408-433c-b07b-3299fba05e8e.jpeg', '', '64', '专业', '43', '小美丽', null, null, '', '0');
INSERT INTO `wct_blog` VALUES ('51', '分享一个考验技巧视频', '<p>这里是详细的内容,可以自己任意编辑的</p><p><img src=\"upload/7ac95187-7274-4432-9d3b-bfb4668fabd4.jpg\" style=\"max-width:100%;\"><br></p>', '2021-04-29 10:06:57', '1', '3df63f7f-97d1-4a4b-b0f7-18dfdba4e954.jpg', 'f74747b8-fd12-4b13-a98e-7d771e2ba7b4.mp4', '64', '专业', '1', 'admin', null, null, '', null);
INSERT INTO `wct_blog` VALUES ('52', '分享一个计算机资料', '<p>这里是详细的编辑,可以任意编辑的,传更多的视频图片都是可以的</p><p><img src=\"http://192.168.31.207:8088/upload/cdd75f5c-5f27-4063-ae5e-b12b1956e69b.jpg\" style=\"max-width:100%;\"/><br/></p>', '2021-04-29 10:15:58', '2', 'b5f904ae-cd97-4f9d-afec-d75e9868d216.jpg', '1ae87474-c013-4c82-a050-1a24b1945b88.mp4', '65', '计算机', '44', 'xiaomi', null, null, '', '0');

-- ----------------------------
-- Table structure for wct_daka
-- ----------------------------
DROP TABLE IF EXISTS `wct_daka`;
CREATE TABLE `wct_daka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(10) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_daka
-- ----------------------------
INSERT INTO `wct_daka` VALUES ('7', '', '', '38', '', '2021-04-28');
INSERT INTO `wct_daka` VALUES ('8', '', '', '38', '', '2021-04-28');
INSERT INTO `wct_daka` VALUES ('9', '', '', '43', '', '2021-04-28');
INSERT INTO `wct_daka` VALUES ('10', '', '', '43', '', '2021-04-28');
INSERT INTO `wct_daka` VALUES ('11', '', '', '44', '', '2021-4-29');

-- ----------------------------
-- Table structure for wct_message
-- ----------------------------
DROP TABLE IF EXISTS `wct_message`;
CREATE TABLE `wct_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `zan` int(11) DEFAULT '0',
  `note` varchar(500) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fusername` varchar(50) DEFAULT NULL,
  `attach` varchar(200) DEFAULT NULL,
  `attachname` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_message
-- ----------------------------
INSERT INTO `wct_message` VALUES ('10', '44', '39', null, '1', null, '看到别人的分享可以加关注,聊天', '2021-04-29 10:14:20', 'xiaomi', '小美', '', '', '6c6b29ad-3fc2-4030-a7ca-af32dad61b5c.jpg');

-- ----------------------------
-- Table structure for wct_notice
-- ----------------------------
DROP TABLE IF EXISTS `wct_notice`;
CREATE TABLE `wct_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `jnote` varchar(255) DEFAULT NULL,
  `pf` int(10) DEFAULT NULL,
  `typeid` int(10) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_notice
-- ----------------------------
INSERT INTO `wct_notice` VALUES ('42', '测试公告通知', '<p>这里是公告通知的详细内容 这里是公告通知的详细内容这里是公告通知的详细内容这里是公告通知的详细内容这里是公告通知的详细内容</p><p>&nbsp;<img src=\"upload/528f8b0a-5c54-44c8-92a3-b7d00f482271.jpg\" style=\"max-width: 100%;\"></p>', '2021-04-29 10:04:03', '1', '011c834e-55ea-4923-8e76-236e399acb3a.jpg', '', null, null, '', null, '');
INSERT INTO `wct_notice` VALUES ('45', '测试资讯', '<p>这里是通知资讯的详细信息</p><p><img src=\"upload/db36189d-aa58-4e5b-80d4-2f86c2593930.jpeg\" style=\"max-width:100%;\"><br></p>', '2021-04-29 10:04:05', '1', 'e758d9c2-11ec-41fc-8981-536d3a1754cb.jpg', '', null, null, '', null, '');
INSERT INTO `wct_notice` VALUES ('46', '测试院校信息', '<p>这里是详细的院校信息的详细介绍</p><p><img src=\"upload/3ed9b7c8-f97d-45c5-8de0-279fcfcec7c0.jpg\" style=\"max-width:100%;\"><br></p>', '2021-04-29 10:03:30', '2', 'cb5a9762-e0b8-43cc-aac8-6e49cd542868.jpg', '', null, null, '', null, '');

-- ----------------------------
-- Table structure for wct_posts
-- ----------------------------
DROP TABLE IF EXISTS `wct_posts`;
CREATE TABLE `wct_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `note2` varchar(500) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `statecn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_posts
-- ----------------------------
INSERT INTO `wct_posts` VALUES ('27', '分享一个专业资料', '这里是详细文字内容', '', '39', '小美', '2021-03-26 16:30:22', '6b7beb6c-97f4-4617-a182-0c85560b536f.mp4', '专业资料', '');
INSERT INTO `wct_posts` VALUES ('28', '我也来分享', '这里试文字描述可以传任意格式的文件', '', '43', '小美丽', '2021-03-26 16:39:39', '9f77df9a-113b-445f-9666-da69c16615dc.mp4', '专业资料', '');

-- ----------------------------
-- Table structure for wct_replay
-- ----------------------------
DROP TABLE IF EXISTS `wct_replay`;
CREATE TABLE `wct_replay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(10) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `ttype` varchar(50) DEFAULT NULL,
  `hot` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_replay
-- ----------------------------
INSERT INTO `wct_replay` VALUES ('46', '24', '回复反馈', '', '', '2021-03-21 17:40:00', null, '', null);
INSERT INTO `wct_replay` VALUES ('47', '41', '下面可以评论', '38', '小新', '2021-03-21 17:43:13', '1', '', '0');
INSERT INTO `wct_replay` VALUES ('48', '24', '并不会', '38', '小新', '2021-03-21 17:43:53', '2', '', '0');
INSERT INTO `wct_replay` VALUES ('49', '41', '可以评论', '39', '小美', '2021-03-26 12:07:06', '1', '', '0');
INSERT INTO `wct_replay` VALUES ('50', '44', '不错,看着都舒服', '43', '小美丽', '2021-03-26 16:37:43', '1', '', '0');
INSERT INTO `wct_replay` VALUES ('51', '27', '谢谢分享', '43', '小美丽', '2021-03-26 16:39:07', '2', '', '0');
INSERT INTO `wct_replay` VALUES ('52', '49', '可以点赞评论可以收藏', '43', '小美丽', '2021-04-17 14:30:27', '1', '', '0');
INSERT INTO `wct_replay` VALUES ('53', '47', '非常不错', '44', 'xiaomi', '2021-04-29 10:13:35', '1', '', '0');
INSERT INTO `wct_replay` VALUES ('54', '28', '讨论回复 ', '44', 'xiaomi', '2021-04-29 10:16:16', '2', '', '0');

-- ----------------------------
-- Table structure for wct_turl
-- ----------------------------
DROP TABLE IF EXISTS `wct_turl`;
CREATE TABLE `wct_turl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `turl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_turl
-- ----------------------------
INSERT INTO `wct_turl` VALUES ('68', '测试数学模块链接', 'http://www.baidu.com/');
INSERT INTO `wct_turl` VALUES ('69', '英语模块', 'http://www.youku.com/');

-- ----------------------------
-- Table structure for wct_type
-- ----------------------------
DROP TABLE IF EXISTS `wct_type`;
CREATE TABLE `wct_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `pid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_type
-- ----------------------------
INSERT INTO `wct_type` VALUES ('61', '数学', '');
INSERT INTO `wct_type` VALUES ('62', '英语', '');
INSERT INTO `wct_type` VALUES ('63', '政治', '');
INSERT INTO `wct_type` VALUES ('64', '专业', '');
INSERT INTO `wct_type` VALUES ('65', '计算机', '');

-- ----------------------------
-- Table structure for wct_user
-- ----------------------------
DROP TABLE IF EXISTS `wct_user`;
CREATE TABLE `wct_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  `roletype` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `sid` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `fids` varchar(200) DEFAULT NULL,
  `statecn` varchar(100) DEFAULT NULL,
  `favs` varchar(255) DEFAULT NULL,
  `qd` int(10) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `fs` int(10) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_user
-- ----------------------------
INSERT INTO `wct_user` VALUES ('1', 'admin', 'admin', '1', null, null, null, null, null, null, null, null, null, null, null, null, '19,20,18', null, null, null, null);
INSERT INTO `wct_user` VALUES ('38', '小新', '111111', '2', '', '15123385885', '', '', '男', '', '3cae1547-3447-48eb-9ae6-4571e68f9ace.jpg', '', '重庆', '', '39,42', '', '18,20,23,22,28,33,31,41', '900', '美丽的少年', '2', '200');
INSERT INTO `wct_user` VALUES ('39', '小美', '111111', '2', '', '15123385885', '', '', '男', '', '57dd6cc9-a8bd-4dc2-8cbf-5761d1c92d6c.jpg', '', '6-12', '', '38,43,44', '', '19,21,17,24,33,38', '1899', '时尚美女', '2', '100');
INSERT INTO `wct_user` VALUES ('42', '小李', '111111', '2', '', '15123385885', '', '', '男', '', '5f7c1610-e0c6-433a-ac9a-34f56edcd8f5.jpg', '', '6-123', '', '38', '', '38', null, '爱旅游的vomen', null, null);
INSERT INTO `wct_user` VALUES ('43', '小美丽', '111111', '2', '', '15123385885', '', '', '男', '', '3b8eb4fc-611c-442b-969a-6c2046158010.jpg', '', '6-123', '', '39', '', '44,49', null, '程序员', null, '100');
INSERT INTO `wct_user` VALUES ('44', 'xiaomi', '111111', '2', '', '16123394994', '', '', '男', '', '6c6b29ad-3fc2-4030-a7ca-af32dad61b5c.jpg', '', '545', '', '39', '', '47', null, '快乐的少年', null, null);
