/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : share

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-10-28 14:21:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appeal
-- ----------------------------
DROP TABLE IF EXISTS `appeal`;
CREATE TABLE `appeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `appealed_id` int(10) NOT NULL COMMENT '被举报的内容/申诉id',
  `type` int(11) NOT NULL COMMENT '被举报的类型/申诉类型：1：视频，2：文章：3：评论\n',
  `status` int(11) NOT NULL COMMENT '申诉/举报的受理状态：0：受理中；1：受理通过；2：受理驳回',
  `content` varchar(255) NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of appeal
-- ----------------------------

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `receiver_id` int(10) NOT NULL,
  `message_content` varchar(255) NOT NULL COMMENT '聊天内容',
  `send_time` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '消息状态：1：未读，2：已读，3：逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `commentor_id` int(10) NOT NULL COMMENT '评论者的id',
  `vid` int(10) NOT NULL COMMENT '评论的文章或视频id',
  `content` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `focus` int(10) unsigned zerofill NOT NULL,
  `statue` int(10) unsigned zerofill NOT NULL COMMENT '默认是0：安全，1：被举报，2：不可见',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `commentor_id_idx` (`commentor_id`),
  CONSTRAINT `commentor_id` FOREIGN KEY (`commentor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '3', '1', '不错不错', '2020-10-22 05:17:13', '0000000002', '0000000000');
INSERT INTO `comment` VALUES ('10001', '2', '2', 'hahahhahahhahhhahhahhha\n', '2020-10-22 14:00:03', '0000000000', '0000000000');
INSERT INTO `comment` VALUES ('10002', '2', '1', 'lalala', '2020-10-22 06:47:07', '0000000002', '0000000000');
INSERT INTO `comment` VALUES ('10004', '2', '2', 'lalala', '2020-10-22 06:46:41', '0000000000', '0000000000');
INSERT INTO `comment` VALUES ('10005', '2', '2', '12345', '2020-10-22 13:26:12', '0000000000', '0000000000');
INSERT INTO `comment` VALUES ('100000', '2', '2', '1234567', '2020-10-22 06:26:48', '0000000000', '0000000000');
INSERT INTO `comment` VALUES ('1000000', '3', '2', '不错不错', '2020-10-22 05:47:34', '0000000001', '0000000000');
INSERT INTO `comment` VALUES ('1000001', '3', '100002', '不错不错', '2020-10-23 07:06:13', '0000000000', '0000000000');
INSERT INTO `comment` VALUES ('1000002', '4', '100000', '不错不错', '2020-10-28 01:18:08', '0000000000', '0000000000');

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `vid` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('1', '1', '4');
INSERT INTO `focus` VALUES ('2', '1', '3');
INSERT INTO `focus` VALUES ('2', '1', '5');
INSERT INTO `focus` VALUES ('1000000', '2', '3');
INSERT INTO `focus` VALUES ('1', '2', '2');
INSERT INTO `focus` VALUES ('10002', '2', '2');
INSERT INTO `focus` VALUES ('10005', '2', '3');
INSERT INTO `focus` VALUES ('10005', '3', '3');
INSERT INTO `focus` VALUES ('10002', '2', '3');
INSERT INTO `focus` VALUES ('1', '2', '3');
INSERT INTO `focus` VALUES ('2', '1', '2');
INSERT INTO `focus` VALUES ('10005', '1', '4');
INSERT INTO `focus` VALUES ('100003', '1', '2');
INSERT INTO `focus` VALUES ('100000', '1', '2');
INSERT INTO `focus` VALUES ('10005', '1', '3');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `details` varchar(255) NOT NULL COMMENT '货物详情',
  `price` float NOT NULL,
  `stock` int(10) NOT NULL,
  `pic` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '三明·星雨新年祭', '三明市 三明体育馆（东乾二路体育馆)', '40', '100', '/images/s1.jpeg', '2021.02.16 - 02.16');
INSERT INTO `goods` VALUES ('2', '昆明·FOCP动漫万圣狂欢祭', '昆明市 紫云青鸟会展中心', '8.8', '100', '/images/s2.jpeg', '2020.10.31 - 11.01');
INSERT INTO `goods` VALUES ('3', '河北·第三届国际动漫游戏产业博览会', '石家庄市 石家庄国际会展中心', '42', '80', '/images/s3.jpeg', '2020.10.23 - 10.25');
INSERT INTO `goods` VALUES ('4', '天津·NARUTO火影忍者动画展', '天津市 天津大悦城', '49', '70', '/images/s4.jpeg', '2020.10.17 - 11.29');
INSERT INTO `goods` VALUES ('5', '【联合主办】2020广州麽多 x bilibili会员购 动漫嘉年华', '广州市 琶洲·保利世贸博览馆', '61', '100', '/images/s5.jpeg', '2020.10.31 - 11.01');
INSERT INTO `goods` VALUES ('6', '赣州·ASC中国动漫文化展览会04-万圣节之夜', '赣州市 华泓智乐广场', '45', '100', '/images/s6.jpeg', '2020.10.31 - 10.31');
INSERT INTO `goods` VALUES ('7', '成都·IFC爱奇艺 x CCCC国际动漫嘉年华', '成都市 完美文创公园', '29', '100', '/images/s7.jpeg', '2020.10.31 - 11.01');
INSERT INTO `goods` VALUES ('8', '【票务总代理】上海·2020WePlay文化展', '上海市 上海世博展览馆', '97.2', '100', '/images/s8.jpeg', '2020.11.14 - 11.15');
INSERT INTO `goods` VALUES ('9', '上海·迪士尼乐园-一日门票', '上海市 上海迪士尼乐园', '274', '100', '/images/s9.jpeg', '2020.07.27 - 11.04');
INSERT INTO `goods` VALUES ('10', '廊坊·马克·夏加尔大展中国首展', '廊坊市 丝绸之路国际文化交流中心', '81', '100', '/images/s10.jpeg', '2020.10.09 - 2021.01.18');
INSERT INTO `goods` VALUES ('11', '南京·THO03-金陵幻梦行', '南京市 玄武湖公园-情侣园', '75', '100', '/images/s11.jpeg', '2020.12.26 - 12.26');
INSERT INTO `goods` VALUES ('12', '上海·新网球王子 × animate cafe 咖啡厅', '上海市 animate cafe上海店', '30', '100', '/images/s12.jpeg', '2020.10.11 - 11.04');
INSERT INTO `goods` VALUES ('13', '上海·神楽Mea 1st Live ~Start~', '上海市 万代南梦宫上海文化中心-梦想剧场', '494', '100', '/images/s13.jpeg', '2020.11.21 - 11.21');
INSERT INTO `goods` VALUES ('14', '苏州·KAJAKAJA扭蛋店', '苏州市 KAJAKAJA扭蛋店', '28', '95', '/images/s14.jpeg', '2020.07.30 - 12.25');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('1', '生活');
INSERT INTO `label` VALUES ('2', '兴趣');
INSERT INTO `label` VALUES ('3', '影视');
INSERT INTO `label` VALUES ('4', '游戏');
INSERT INTO `label` VALUES ('5', '动画');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `good_id` int(10) NOT NULL,
  `number` int(10) NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `total` float NOT NULL COMMENT '总价钱',
  `degree` int(11) NOT NULL COMMENT '用户是否可见',
  `paytype` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `good_id_idx` (`good_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '3', '14', '1', '2020-10-19 03:13:38', '4', '28', '0', '1', '18790987098', 'lili');
INSERT INTO `order` VALUES ('2', '3', '14', '1', '2020-10-19 03:19:06', '2', '28', '0', '1', '18790987098', '张珊');
INSERT INTO `order` VALUES ('3', '3', '14', '1', '2020-10-19 03:22:04', '2', '28', '0', '1', '18790987098', '王五');
INSERT INTO `order` VALUES ('4', '3', '14', '3', '2020-10-19 05:03:29', '2', '84', '0', '1', '18790987098', '李氏');
INSERT INTO `order` VALUES ('5', '3', '14', '1', '2020-10-19 05:35:19', '2', '28', '0', '1', '18790987098', 'tom');
INSERT INTO `order` VALUES ('6', '3', '14', '1', '2020-10-19 05:38:31', '2', '28', '0', '1', '18790987098', 'lisa');
INSERT INTO `order` VALUES ('7', '3', '14', '1', '2020-10-19 05:50:19', '2', '28', '0', '1', '18790987098', 'jack');
INSERT INTO `order` VALUES ('8', '3', '14', '1', '2020-10-19 06:03:33', '2', '28', '0', '1', '18790987098', '王伟');
INSERT INTO `order` VALUES ('9', '3', '14', '1', '2020-10-20 07:00:48', '2', '28', '0', '2', '18790987098', 'tom');
INSERT INTO `order` VALUES ('10', '2', '14', '1', '2020-10-22 13:27:18', '2', '28', '0', '1', '18790987098', 'jack');
INSERT INTO `order` VALUES ('663', '3', '14', '1', '2020-10-24 01:37:47', '2', '28', '0', '1', '18790987098', 'ling');
INSERT INTO `order` VALUES ('769', '4', '14', '1', '2020-10-24 01:21:48', '2', '28', '0', '1', '18790987098', 'Cheney');
INSERT INTO `order` VALUES ('793', '4', '14', '1', '2020-10-24 01:30:05', '2', '28', '0', '1', '18790987098', 'shandy');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) NOT NULL COMMENT '评论id',
  `replyor_id` int(10) NOT NULL COMMENT '回复者id',
  `content` varchar(255) NOT NULL COMMENT '回复内容',
  `time` datetime NOT NULL,
  `focus` int(10) unsigned zerofill NOT NULL,
  `statue` int(10) unsigned zerofill NOT NULL COMMENT '状态：0 ，默认无举报，1：被举报，2.不可见',
  PRIMARY KEY (`id`),
  KEY `replyor_id_idx` (`replyor_id`),
  KEY `commentor_id_idx` (`comment_id`),
  CONSTRAINT `replyor_id` FOREIGN KEY (`replyor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('10001', '1', '3', '12334', '2020-10-23 02:37:05', '0000000000', '0000000000');
INSERT INTO `reply` VALUES ('10005', '10002', '3', '123456', '2020-10-22 07:13:12', '0000000001', '0000000000');
INSERT INTO `reply` VALUES ('10006', '10004', '2', '12345', '2020-10-22 13:25:57', '0000000000', '0000000000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL COMMENT '用户id系统提供',
  `username` varchar(45) NOT NULL COMMENT '用户名（用户创建）',
  `email` varchar(45) NOT NULL COMMENT '邮箱',
  `password` varchar(45) NOT NULL COMMENT '登录密码',
  `statue` int(11) NOT NULL COMMENT '0:正常 1：不可用',
  `degree` int(10) unsigned zerofill NOT NULL COMMENT '0:普通用户 1 管理员',
  `is_online` int(11) NOT NULL COMMENT '用户是否在线：0：不在线；1：在线',
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '1640830027@qq.com', '123456', '0', '0000000001', '0', '/resource/user_pic/default_1.jpg');
INSERT INTO `user` VALUES ('2', 'ssm', '1640830027@qq.com', '123456', '0', '0000000000', '1', '/resource/user_pic/default_2.jpg');
INSERT INTO `user` VALUES ('3', 'lisa', 'z15083820752@163.com', '123456', '0', '0000000000', '1', '/resource/user_pic/default_3.jpg');
INSERT INTO `user` VALUES ('4', 'zhang', 'z15083820752@163.com', '123456', '0', '0000000000', '1', '/resource/user_pic/default_4.jpg');
INSERT INTO `user` VALUES ('5', 'lili', 'z15083820752@163.com', '123456', '0', '0000000000', '1', '/resource/user_pic/default_5.jpg');
INSERT INTO `user` VALUES ('6', 'luminla', '1259129183@qq.com', 'ggsuup2020', '0', '0000000000', '1', null);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `title` varchar(45) NOT NULL,
  `cover_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `statue` int(10) unsigned zerofill NOT NULL COMMENT '作品状态：默认为0 ：待审核；1：审核通过；2：冻结,假删除',
  `focus` int(10) unsigned zerofill NOT NULL COMMENT '点赞数',
  `type` int(11) NOT NULL COMMENT '类型：1：文章 ；2：视频',
  `label_id` int(10) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `label_id_idx` (`label_id`),
  CONSTRAINT `label_id` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100045 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('1', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\md\\demo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\n\n不用说lovelive第三世代TV播出，\n\n点兔再有新篇章，\n\n突击莉莉可谓小圆精神续作，\n\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\n\n隔壁猴山买下强袭魔女第三季，\n\n单说接下来的这一部，便有诸多不平凡');
INSERT INTO `work` VALUES ('2', '4', '万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '/resource/user_pic/7288wc.webp', 'C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\md\\demo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('3', '4', '“奈何你得长安雪，飘不进我得江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:16:10', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('10005', '2', '带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '/resource/user_pic/hX4169.webp', 'C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\md\\demo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000002', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100000', '2', '当我和别人说我感冒了', '/resource/user_pic/bili_img_415116607.jpg', '/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100001', '4', '喜羊羊 时代变了', '/resource/user_pic/thumb.jpg', '/resource/video/1.mp4', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100002', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '/resource/user_pic/123er.jpg', '/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100003', '2', '“奈何你的长安雪，飘不进我的江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:17:49', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('100004', '3', '“奈何你得长安雪，飘不进我得江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:16:10', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('100005', '2', '“奈何你得长安雪，飘不进我得江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:16:10', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('100006', '3', '“奈何你得长安雪，飘不进我得江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:16:10', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('100007', '3', '“奈何你得长安雪，飘不进我得江南岸”', '/resource/user_pic/12342.jpg', '/resource/video/1234r.mp4', '2020-10-23 07:16:10', '0000000000', '0000000001', '2', '2', 'BGM：故里封春 -阿YueYue（原唱：喔喔）');
INSERT INTO `work` VALUES ('100008', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\r\n\r\n不用说lovelive第三世代TV播出，\r\n\r\n点兔再有新篇章，\r\n\r\n突击莉莉可谓小圆精神续作，\r\n\r\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\r\n\r\n隔壁猴山买下强袭魔女第三季，\r\n\r\n单说接下来的这一部，便有诸多不平凡\r\n');
INSERT INTO `work` VALUES ('100009', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\r\n\r\n不用说lovelive第三世代TV播出，\r\n\r\n点兔再有新篇章，\r\n\r\n突击莉莉可谓小圆精神续作，\r\n\r\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\r\n\r\n隔壁猴山买下强袭魔女第三季，\r\n\r\n单说接下来的这一部，便有诸多不平凡\r\n');
INSERT INTO `work` VALUES ('100010', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\r\n\r\n不用说lovelive第三世代TV播出，\r\n\r\n点兔再有新篇章，\r\n\r\n突击莉莉可谓小圆精神续作，\r\n\r\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\r\n\r\n隔壁猴山买下强袭魔女第三季，\r\n\r\n单说接下来的这一部，便有诸多不平凡\r\n');
INSERT INTO `work` VALUES ('100011', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\r\n\r\n不用说lovelive第三世代TV播出，\r\n\r\n点兔再有新篇章，\r\n\r\n突击莉莉可谓小圆精神续作，\r\n\r\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\r\n\r\n隔壁猴山买下强袭魔女第三季，\r\n\r\n单说接下来的这一部，便有诸多不平凡\r\n');
INSERT INTO `work` VALUES ('100012', '3', '关于新番《战翼的希格德莉法》的一点想说的', '/resource/user_pic/4P120Y.webp', 'C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo13.md', '2020-10-20 09:42:43', '0000000000', '0000000001', '1', '5', '又是一个神仙打架的季度呢，这一季度的番都很不简单：\r\n\r\n不用说lovelive第三世代TV播出，\r\n\r\n点兔再有新篇章，\r\n\r\n突击莉莉可谓小圆精神续作，\r\n\r\n更不必说魔女之旅经费爆炸，格外绚丽，时不时跳戏到《哈利波特》和某不愿透露姓名的灰袍近战法师，还引起各位读研的b站友人的共鸣，\r\n\r\n隔壁猴山买下强袭魔女第三季，\r\n\r\n单说接下来的这一部，便有诸多不平凡\r\n');
INSERT INTO `work` VALUES ('100013', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100014', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100015', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100016', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100017', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100018', '4', '	万物皆可联动！你知道为了打破“次元壁”游戏们都有哪些神操作吗？', '	/resource/user_pic/7288wc.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo12.md', '2020-10-22 02:45:56', '0000000000', '0000000003', '1', '4', '	肯德基要出螺蛳粉了，这事儿说出来你敢信吗？万万没想到，在有生之年我还能见到快餐品牌和地方特色美食联动，也是没谁了。不过，肯德基真的不怕这么“味儿”的食物把其它客人熏走吗，还真是十分令人费解的操作。');
INSERT INTO `work` VALUES ('100019', '2', '	带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '	/resource/user_pic/hX4169.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000001', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100020', '2', '	带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '	/resource/user_pic/hX4169.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000001', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100021', '2', '	带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '	/resource/user_pic/hX4169.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000001', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100022', '2', '	带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '	/resource/user_pic/hX4169.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000001', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100023', '2', '	带款偏光驾驶镜是什么体验？开箱魔洁兔偏光驾驶镜T1给你答案', '	/resource/user_pic/hX4169.webp', '	C:UserslenovoIdeaProjectsShareLifesrcmainwebapp\resourcemddemo6f1C8sG1.md', '2020-10-22 13:33:14', '0000000000', '0000000001', '1', '1', '对于经常开车的小伙伴来说，要是我说到太阳刺眼，或者远光灯刺眼，想必很多人都是感同身受的，毕竟这两种确实非常影响我们的驾驶体验，但是又很难避免。只能更多的从自身角度去解决这样的事情，最近我就入手了一款偏光驾驶镜，主要就是针对光线给我带来的困扰问题，一方面可以有效避免我的头晕目眩，另外也可以保护我们的眼睛。下面就和大家一起来开箱看一看这样的一款产品到底会不会让你有一个更舒适的驾驶体验呢？');
INSERT INTO `work` VALUES ('100024', '2', '当我和别人说我感冒了', '	/resource/user_pic/bili_img_415116607.jpg', '	/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100025', '2', '当我和别人说我感冒了', '	/resource/user_pic/bili_img_415116607.jpg', '	/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100026', '2', '当我和别人说我感冒了', '	/resource/user_pic/bili_img_415116607.jpg', '	/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100027', '2', '当我和别人说我感冒了', '	/resource/user_pic/bili_img_415116607.jpg', '	/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100028', '2', '当我和别人说我感冒了', '	/resource/user_pic/bili_img_415116607.jpg', '	/resource/video/000.mp4', '2020-10-22 12:17:06', '0000000000', '0000000001', '2', '1', '当我和别人说我感冒了');
INSERT INTO `work` VALUES ('100029', '4', '喜羊羊 时代变了', '	/resource/user_pic/thumb.jpg', '	/resource/video/1.mp4	', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '	喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100030', '4', '喜羊羊 时代变了', '	/resource/user_pic/thumb.jpg', '	/resource/video/1.mp4	', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '	喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100031', '4', '喜羊羊 时代变了', '	/resource/user_pic/thumb.jpg', '	/resource/video/1.mp4	', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '	喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100032', '4', '喜羊羊 时代变了', '	/resource/user_pic/thumb.jpg', '	/resource/video/1.mp4	', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '	喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100033', '4', '喜羊羊 时代变了', '	/resource/user_pic/thumb.jpg', '	/resource/video/1.mp4	', '2020-10-23 06:30:15', '0000000000', '0000000000', '2', '5', '	喜羊羊 时代变了 混剪');
INSERT INTO `work` VALUES ('100034', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '	/resource/user_pic/123er.jpg', '	/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100035', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '	/resource/user_pic/123er.jpg', '	/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100036', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '	/resource/user_pic/123er.jpg', '	/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100037', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '	/resource/user_pic/123er.jpg', '	/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100038', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了', '	/resource/user_pic/123er.jpg', '	/resource/video/231.mp4', '2020-10-23 07:00:16', '0000000000', '0000000000', '2', '3', '【甄嬛传/四寰/诛心记】路行至此，也只能我死我生了');
INSERT INTO `work` VALUES ('100039', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
INSERT INTO `work` VALUES ('100040', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
INSERT INTO `work` VALUES ('100041', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
INSERT INTO `work` VALUES ('100042', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
INSERT INTO `work` VALUES ('100043', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
INSERT INTO `work` VALUES ('100044', '2', '【第五人格手书】他们的故事', '/resource/user_pic/d5.jpg', '/resource/video/d5.mp4', '2020-10-26 06:51:11', '0000000000', '0000000000', '2', '4', '【第五人格手书】他们的故事');
