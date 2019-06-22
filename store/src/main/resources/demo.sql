/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-06-22 21:18:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(16) NOT NULL,
  `product_id` int(16) DEFAULT NULL,
  `user_id` int(16) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL COMMENT '审核标志',
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `global_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `global_parameter`;
CREATE TABLE `global_parameter` (
  `para_id` int(10) NOT NULL,
  `web_name` varchar(20) DEFAULT NULL,
  `reg_clause` varchar(100) DEFAULT NULL COMMENT '注册条款',
  `notice` varchar(100) DEFAULT NULL COMMENT '公告',
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `copyright` varchar(20) DEFAULT NULL,
  `weblogo` varchar(20) DEFAULT NULL,
  `afford_method` varchar(100) DEFAULT NULL,
  `shops_stream` varchar(100) DEFAULT NULL,
  `post_method` varchar(100) DEFAULT NULL COMMENT '送货方式',
  `post_price` decimal(10,2) DEFAULT NULL,
  `post_desc` varchar(100) DEFAULT NULL COMMENT '运输说明',
  `work_time` varchar(50) DEFAULT NULL,
  `after_service` varchar(100) DEFAULT NULL,
  `law` varchar(100) DEFAULT NULL,
  `commques` varchar(100) DEFAULT NULL COMMENT '常见问题',
  `deal_rule` varchar(100) DEFAULT NULL COMMENT '交易条款',
  PRIMARY KEY (`para_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of global_parameter
-- ----------------------------
INSERT INTO `global_parameter` VALUES ('1', 'XX菜园，你值得拥有', '你可以注册', '请注意，这是公告', '广州海珠区仲恺路500号', '50000', '15814516280', '东东', 'img/dd.jpg', null, null, null, null, null, '7X24小时', null, null, '没问题', '没问题');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '订单id',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `payment` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、微信，2、支付宝',
  `status` int(5) NOT NULL COMMENT '状态：0、未付款，1、已付款，2、未发货，3、已发货，4、交易成功，5、交易关闭',
  `post_fee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `order_mount` int(10) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `buyer_message` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `payment_type` (`payment_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(16) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) DEFAULT NULL COMMENT '订单号',
  `order_id` varchar(60) DEFAULT NULL,
  `product_id` int(16) DEFAULT NULL,
  `store_id` int(16) DEFAULT NULL,
  `mount` int(16) DEFAULT NULL COMMENT '卖出数量',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10,2) DEFAULT NULL,
  `post_status` varchar(10) DEFAULT NULL COMMENT '支付、发货状态',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_status` varchar(10) DEFAULT NULL COMMENT '收货状态',
  `image_url` varchar(150) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `order_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping` (
  `order_id` varchar(50) NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `priv_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_parent` int(2) DEFAULT NULL,
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '系统后台管理', 'system', '', '0', '2018-11-11 22:10:57', '2018-11-11 22:11:00', '1');
INSERT INTO `privilege` VALUES ('2', '角色管理', 'role-manage', 'admin/role', '1', '2018-11-11 22:12:16', '2018-11-24 20:32:19', '1');
INSERT INTO `privilege` VALUES ('3', '店铺管理', 'store-manage', 'admin/store', '1', '2018-11-11 22:17:23', '2018-11-24 20:32:15', '1');
INSERT INTO `privilege` VALUES ('4', '用户管理', 'user-manage', 'admin/user', '1', '2018-11-11 22:18:53', '2018-11-24 20:32:10', '1');
INSERT INTO `privilege` VALUES ('5', '权限管理', 'privilege-manage', 'privilege', '1', '2018-11-11 22:19:18', '2018-11-19 20:54:53', '1');
INSERT INTO `privilege` VALUES ('6', '添加角色', 'role-add', 'admin/role/addition', '2', '2018-11-11 22:19:45', '2018-11-19 10:27:02', '0');
INSERT INTO `privilege` VALUES ('7', '角色列表', 'role-list', 'admin/role/list', '2', '2018-11-11 22:20:14', '2018-11-18 23:10:41', '0');
INSERT INTO `privilege` VALUES ('8', '角色修改', 'role-edit', 'admin/role/edit', '2', '2018-11-11 22:20:36', '2018-11-18 23:10:48', '0');
INSERT INTO `privilege` VALUES ('9', '角色删除', 'role-delete', 'admin/role/deletion', '2', '2018-11-11 22:23:13', '2018-11-18 23:10:57', '0');
INSERT INTO `privilege` VALUES ('10', '店铺列表', 'store-list', 'admin/store/list', '3', '2018-11-11 22:23:50', '2018-11-18 23:11:04', '0');
INSERT INTO `privilege` VALUES ('11', '店铺添加', 'store-add', 'admin/store/addition', '3', '2018-11-11 22:24:47', '2018-11-18 23:11:12', '0');
INSERT INTO `privilege` VALUES ('12', '店铺修改', 'store-edit', 'admin/store/edit', '3', '2018-11-11 22:25:41', '2018-11-18 23:11:18', '0');
INSERT INTO `privilege` VALUES ('13', '店铺删除', 'store-delete', 'admin/store/deletion', '3', '2018-11-11 22:26:25', '2018-11-18 23:11:25', '0');
INSERT INTO `privilege` VALUES ('14', '用户修改', 'user-edit', 'admin/user/edit', '4', '2018-11-11 22:27:06', '2018-11-18 23:11:33', '0');
INSERT INTO `privilege` VALUES ('15', '用户删除', 'user-delete', 'admin/user/deletion', '4', '2018-11-11 22:28:21', '2018-11-26 21:12:37', '0');
INSERT INTO `privilege` VALUES ('16', '用户列表', 'user-list', 'admin/user/list', '4', '2018-11-11 22:28:41', '2018-11-18 23:12:03', '0');
INSERT INTO `privilege` VALUES ('17', '用户添加', 'user-add', 'admin/user/addition', '4', '2018-11-11 22:29:04', '2018-11-18 23:12:10', '0');
INSERT INTO `privilege` VALUES ('18', '权限添加', 'privilege-add', 'admin/privilege/addition', '5', '2018-11-11 22:30:05', '2018-11-18 23:22:52', '0');
INSERT INTO `privilege` VALUES ('19', '权限列表', 'privilege-list', 'admin/privilege/list', '5', '2018-11-11 22:40:35', '2018-11-18 23:23:01', '0');
INSERT INTO `privilege` VALUES ('20', '权限修改', 'privilege-edit', 'admin/privilege/edit', '5', '2018-11-11 22:41:02', '2018-11-18 23:23:30', '0');
INSERT INTO `privilege` VALUES ('21', '权限删除', 'privilege-delete', 'admin/privilege/deletion', '5', '2018-11-11 22:41:34', '2018-11-18 23:23:19', '0');
INSERT INTO `privilege` VALUES ('32', '菜品管理', 'book-manage', 'admin/product', '1', '2018-11-19 20:53:08', '2018-11-24 20:32:05', '1');
INSERT INTO `privilege` VALUES ('33', '菜品添加上架', 'book-add', 'product/addition', '32', '2018-11-19 20:53:12', '2018-11-21 20:41:33', '0');
INSERT INTO `privilege` VALUES ('34', '菜品编辑', 'book-edit', 'product/edit', '32', '2018-11-19 20:56:48', '2018-11-19 20:57:44', '0');
INSERT INTO `privilege` VALUES ('35', '菜品下架', 'book-shelf', 'admin/product/shelf', '32', '2018-11-19 20:57:49', '2018-11-25 23:33:47', '0');
INSERT INTO `privilege` VALUES ('36', '菜品查询', 'book-query', 'product/query', '32', '2018-11-19 20:59:52', '2018-11-19 21:01:48', '0');
INSERT INTO `privilege` VALUES ('39', '个人中心', 'personal-center', 'admin/personal', '1', '2018-11-23 16:06:51', '2018-11-24 20:32:26', '1');
INSERT INTO `privilege` VALUES ('40', '我的信息', 'person-info', '/admin/user/edti', '39', '2018-11-23 16:08:53', '2018-11-23 16:13:45', '0');
INSERT INTO `privilege` VALUES ('42', '我的店铺', 'person-store', '/admin/store/edit', '39', '2018-11-23 16:10:01', '2018-11-23 16:11:09', '0');
INSERT INTO `privilege` VALUES ('43', '我的菜品', 'person-book-list', '/admin/product/list', '39', '2018-11-23 16:11:54', '2018-11-23 16:13:38', '0');
INSERT INTO `privilege` VALUES ('44', '订单管理', 'order-manage', 'admin/order', '1', '2018-11-24 20:31:14', '2018-11-24 20:31:47', '1');
INSERT INTO `privilege` VALUES ('45', '订单列表', 'order-list', 'admin/order/list', '44', '2018-11-24 20:31:16', '2018-11-24 20:32:54', '0');
INSERT INTO `privilege` VALUES ('46', '订单修改', 'order-edit', 'admin/order/edit', '44', '2018-11-24 20:32:58', '2018-11-24 20:33:28', '0');
INSERT INTO `privilege` VALUES ('47', '订单删除', 'order-delete', 'admin/order/deletion', '44', '2018-11-24 20:33:31', '2018-11-24 20:34:02', '0');
INSERT INTO `privilege` VALUES ('49', '菜品删除', 'book-delete', 'admin/product/deletion', '32', '2018-11-25 23:32:31', '2018-11-25 23:32:51', '0');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `cate_id` int(16) NOT NULL AUTO_INCREMENT,
  `parent_id` int(16) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort_order` int(4) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('2', null, '新鲜蔬菜', '1', '1', '0', '2018-11-01 09:43:46', '2018-11-01 09:43:49');
INSERT INTO `product_category` VALUES ('3', null, '时令水果', '1', '1', '0', '2018-11-01 09:46:08', '2018-11-01 09:46:11');
INSERT INTO `product_category` VALUES ('4', null, '水产海鲜', '1', '1', '0', '2018-11-01 09:46:33', '2018-11-01 09:46:35');
INSERT INTO `product_category` VALUES ('5', null, '品质肉禽蛋', '1', '1', '0', '2018-11-01 09:47:09', '2018-11-01 09:47:12');

-- ----------------------------
-- Table structure for `product_desc`
-- ----------------------------
DROP TABLE IF EXISTS `product_desc`;
CREATE TABLE `product_desc` (
  `product_id` int(11) NOT NULL,
  `product_desc` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_desc
-- ----------------------------
INSERT INTO `product_desc` VALUES ('1', '<p><br/><a href=\"http://store.dangdang.com/gys_04099_dytg\" style=\"color: rgb(26, 102, 179); font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/ueditor/jsp/upload/image/20181124/1543065820217043526.jpg\"/></a></p>', '2018-11-24 21:23:43', '2019-06-16 11:13:18');
INSERT INTO `product_desc` VALUES ('2', null, '2019-06-16 16:12:32', '2019-06-16 16:12:32');
INSERT INTO `product_desc` VALUES ('3', null, '2019-06-16 11:11:20', '2019-06-16 11:11:20');
INSERT INTO `product_desc` VALUES ('4', '<p>该西红柿来自 新西兰进口，真好吃啊，真好吃<br/></p>', '2019-06-15 18:10:46', '2019-06-16 16:16:38');
INSERT INTO `product_desc` VALUES ('5', '<h1 style=\"margin: 0px; padding: 0px 0px 0.2em; font-size: 16px; font-family: &quot;microsoft yahei&quot;; line-height: 1; white-space: normal; background-color: rgb(255, 255, 255);\">云南特产高原新鲜红皮小土豆黄心农家自种10斤带箱迷你马铃薯洋芋</h1><p><br/></p>', '2019-06-16 19:38:54', '2019-06-16 19:38:54');
INSERT INTO `product_desc` VALUES ('6', '<h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">长茄新鲜蔬菜长茄紫黑色茄子现摘现发农家</h3><p><br/></p>', '2019-06-16 19:42:29', '2019-06-16 19:42:29');
INSERT INTO `product_desc` VALUES ('7', '<p><span style=\"color: rgb(0, 0, 0);\">云南新鲜老南瓜宝宝辅食农家老品种红皮甜南瓜</span></p>', '2019-06-16 19:46:23', '2019-06-16 19:46:23');
INSERT INTO `product_desc` VALUES ('8', '<p>农家自养土鸡</p>', '2019-06-16 19:48:05', '2019-06-16 19:48:05');
INSERT INTO `product_desc` VALUES ('9', '<p>新鲜车厘子</p>', '2019-06-16 20:02:05', '2019-06-16 20:02:05');
INSERT INTO `product_desc` VALUES ('10', '<p>新鲜生蚝</p>', '2019-06-16 20:11:45', '2019-06-16 20:11:45');

-- ----------------------------
-- Table structure for `product_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` int(16) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(16) DEFAULT NULL,
  `store_id` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `outline` varchar(255) DEFAULT NULL COMMENT '简介',
  `detail` varchar(500) DEFAULT NULL COMMENT '商品详情',
  `price` decimal(10,2) DEFAULT NULL,
  `pages` int(10) DEFAULT NULL COMMENT '总页数',
  `catalog` varchar(255) DEFAULT NULL COMMENT '目录',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价\\定价',
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `deal_mount` int(10) DEFAULT NULL COMMENT '成交量',
  `look_mount` int(10) DEFAULT NULL COMMENT '浏览量',
  `discount` decimal(5,2) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL COMMENT '版面图片',
  `store_mount` int(10) DEFAULT NULL COMMENT '库存数量',
  `store_time` datetime DEFAULT NULL COMMENT '入库时间',
  `pack_style` varchar(50) DEFAULT NULL COMMENT '封装方式',
  `is_shelf` int(2) DEFAULT NULL COMMENT '是否上架',
  PRIMARY KEY (`product_id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1', '5', '1', '土鸡蛋', '正宗土鸡蛋农家散养新鲜农村自养天然鸡蛋', '', '11.50', null, '', '10.00', null, '200', '211', '11.50', 'upload/images/jiDan.jpg', '199', '2018-11-01 14:58:43', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('2', '5', '1', '鸭蛋', '鸭蛋鸭蛋真好吃', '本书第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据*的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和*实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。', '20.00', null, '', '24.00', null, '300', '307', '8.30', 'upload/images/yadan.jpg', '200', '2018-11-01 14:58:44', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('3', '4', '1', '新鲜大虾', '新鲜大虾非常新鲜啊', null, '30.00', null, null, '25.00', null, null, null, '12.00', 'upload/images/abe39cb84cdf4a31.jpg', '20', null, null, '1');
INSERT INTO `product_info` VALUES ('4', '2', '1', '西红柿', '红红的西红柿真好吃', null, '5.00', null, null, '4.90', null, '100', '107', '10.20', 'upload/images/xihongshi.jpg', '20', '2019-06-15 18:10:43', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('5', '2', '1', '土豆', '云南特产高原新鲜红皮小土豆黄心农家自种10斤带箱迷你马铃薯洋芋', null, '5.00', null, null, '6.00', null, '100', '100', '8.30', 'upload/images/2bcfa9b6327c4608.jpg', '300', '2019-06-16 19:38:48', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('6', '2', '1', '茄子', '长茄新鲜蔬菜长茄紫黑色茄子现摘现发农家', null, '2.00', null, null, '1.50', null, '100', '100', '13.30', 'upload/images/94c9eb14942948af.jpg', '100', '2019-06-16 19:42:29', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('7', '2', '1', '南瓜', '云南新鲜老南瓜宝宝辅食农家老品种红皮甜南瓜', null, '7.00', null, null, '8.00', null, '100', '100', '8.80', 'upload/images/4920615b5a444d70.jpg', '234', '2019-06-16 19:46:23', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('8', '5', '1', '土鸡', '农家自养土鸡', null, '20.00', null, null, '25.00', null, '100', '100', '8.00', 'upload/images/bcad5a24761c4fe4.jpg', '20', '2019-06-16 19:48:05', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('9', '3', '1', '车厘子', '新鲜车厘子', null, '40.00', null, null, '39.90', null, '100', '101', '10.00', 'upload/images/23b51bc9785b4f28.jpg', '100', '2019-06-16 20:02:05', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('10', '4', '1', '生蚝', '新鲜生蚝', null, '20.00', null, null, '19.90', null, '100', '100', '10.10', 'upload/images/78be8511d2bb441d.jpg', '200', '2019-06-16 20:11:45', '平装-胶订', '1');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(16) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `user_id` int(16) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'admin', '超级管理员，拥有所有权限', '2018-11-04 22:14:09', '2018-11-04 22:14:11');
INSERT INTO `role` VALUES ('2', '普通用户', 'customer', '一般用户，买东西的', '2018-11-04 22:16:03', '2018-11-04 22:16:06');
INSERT INTO `role` VALUES ('3', '商家', 'business', '个体商家、企业商家，卖家', '2018-11-04 22:17:54', '2018-11-04 22:17:57');
INSERT INTO `role` VALUES ('5', '老板', 'boss', '最高领导人', '2018-11-18 17:50:42', '2018-11-18 17:50:44');
INSERT INTO `role` VALUES ('6', '用户管理员', 'user-manager', '管理系统中的用户', '2018-11-21 20:48:00', '2018-11-21 20:48:04');
INSERT INTO `role` VALUES ('7', '店铺管理员', 'store-manager', '管理在本站注册的店铺', '2018-11-21 20:48:45', '2018-11-21 20:48:47');
INSERT INTO `role` VALUES ('8', 'VIP用户', 'vip-customer', 'VIP用户，买书有折扣', '2018-11-21 21:09:17', '2018-11-21 21:09:20');
INSERT INTO `role` VALUES ('9', '角色权限管理员', 'role-privilege-manager', '管理角色权限信息', '2018-11-23 23:13:51', '2018-11-23 23:13:51');

-- ----------------------------
-- Table structure for `role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `role_id` int(16) NOT NULL,
  `privilege_id` int(16) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1', '2019-06-15 15:04:55', '2019-06-15 15:04:55');
INSERT INTO `role_privilege` VALUES ('1', '2', '2019-06-15 15:04:55', '2019-06-15 15:04:55');
INSERT INTO `role_privilege` VALUES ('1', '3', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '4', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '5', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '6', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '7', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '8', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '9', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '10', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '11', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '12', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '13', '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES ('1', '14', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '15', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '16', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '17', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '18', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '19', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '20', '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES ('1', '21', '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES ('1', '32', '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES ('1', '33', '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES ('1', '34', '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES ('1', '35', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '36', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '39', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '40', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '42', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '43', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '44', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '45', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '46', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '47', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('1', '49', '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES ('3', '1', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '3', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '4', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '12', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '14', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '32', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '33', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '34', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '35', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '36', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '39', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '40', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '42', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '43', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '44', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '45', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '46', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '47', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '49', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('5', '1', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '2', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '3', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '4', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '5', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '6', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '7', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '8', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '9', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '10', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '11', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '12', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '13', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '14', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '15', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '16', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '17', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '18', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '19', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '20', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '21', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '32', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '33', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '34', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '35', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '36', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '39', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '40', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '42', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '43', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '44', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '45', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '46', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '47', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '49', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('6', '1', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '4', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '14', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '15', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '16', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '17', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '39', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '40', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '42', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '43', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('7', '1', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '3', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '10', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '11', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '12', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '13', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '39', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '40', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '42', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '43', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('9', '1', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '2', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '5', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '6', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '7', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '8', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '9', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '18', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '19', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '20', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '21', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '39', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '40', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '42', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '43', '2018-11-23 23:14:15', '2018-11-23 23:14:15');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(16) NOT NULL AUTO_INCREMENT,
  `store_manager_id` int(16) DEFAULT NULL,
  `store_phone_num` varchar(16) DEFAULT NULL,
  `store_telephone` varchar(16) DEFAULT NULL,
  `store_name` varchar(64) DEFAULT NULL,
  `store_position` varchar(128) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  KEY `store_manager_id` (`store_manager_id`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`store_manager_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '2', '15814516280', '06685337781', 'TEST商铺', '深圳南山区', '2019-06-15 15:04:27', '2019-06-15 15:04:27');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `zip_code` varchar(16) DEFAULT NULL COMMENT '邮政编码',
  `location` varchar(32) DEFAULT NULL,
  `detail_address` varchar(64) DEFAULT NULL,
  `identity` varchar(32) DEFAULT NULL COMMENT '身份',
  `active` char(1) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL COMMENT '用户激活码',
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '414882567@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号阿斯顿', '管理员', '1', null, '2018-11-11 20:14:23', '2018-10-30 17:45:32');
-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(16) NOT NULL,
  `role_id` int(16) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '2018-11-24 22:35:40', '2018-11-24 22:35:40');
