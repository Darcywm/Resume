/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 14/07/2019 21:19:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int(16) NOT NULL,
  `product_id` int(16) NULL DEFAULT NULL,
  `user_id` int(16) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核标志',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `customer_id`(`user_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_parameter
-- ----------------------------
DROP TABLE IF EXISTS `global_parameter`;
CREATE TABLE `global_parameter`  (
  `para_id` int(10) NOT NULL,
  `web_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reg_clause` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册条款',
  `notice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weblogo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `afford_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shops_stream` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送货方式',
  `post_price` decimal(10, 2) NULL DEFAULT NULL,
  `post_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运输说明',
  `work_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `after_service` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `law` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commques` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常见问题',
  `deal_rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易条款',
  PRIMARY KEY (`para_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global_parameter
-- ----------------------------
INSERT INTO `global_parameter` VALUES (1, 'XX菜园，你值得拥有', '你可以注册', '请注意，这是公告', 'xxxxx', '50000', '15814516280', 'xx', 'img/dd.jpg', NULL, NULL, NULL, NULL, NULL, '7X24小时', NULL, NULL, '没问题', '没问题');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_detail_id` int(16) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` int(16) NULL DEFAULT NULL,
  `store_id` int(16) NULL DEFAULT NULL,
  `mount` int(16) NULL DEFAULT NULL COMMENT '卖出数量',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10, 2) NULL DEFAULT NULL,
  `post_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付、发货状态',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货状态',
  `image_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------
INSERT INTO `order_shipping` VALUES ('1091780632524578', 'hehe', NULL, '15814516280', '广东', '广州', '海珠区', '广州海珠区', NULL, '2018-11-26 22:09:44', '2018-11-26 22:09:44');
INSERT INTO `order_shipping` VALUES ('1136421684699735', 'zdd', NULL, '15814516280', '广东', '广州', '海珠区', '广州仲恺路500号1', '55555', '2019-06-23 11:01:20', '2019-06-23 11:01:20');
INSERT INTO `order_shipping` VALUES ('23920885273465502', 'wdd', NULL, '15814516280', '广东', '广州', '海珠区', '广州仲恺路500号', '55555', '2018-11-24 16:33:56', '2018-11-24 16:33:56');
INSERT INTO `order_shipping` VALUES ('2478071473326912', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 14:44:52', '2019-06-23 14:44:52');
INSERT INTO `order_shipping` VALUES ('4830700573522270', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:17:00', '2019-06-23 21:17:00');
INSERT INTO `order_shipping` VALUES ('4830708486058442', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:17:00', '2019-06-23 21:17:00');
INSERT INTO `order_shipping` VALUES ('5025415316162318', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:49:28', '2019-06-23 21:49:28');
INSERT INTO `order_shipping` VALUES ('5025646576849289', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:49:29', '2019-06-23 21:49:29');
INSERT INTO `order_shipping` VALUES ('5049816032027607', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:53:31', '2019-06-23 21:53:31');
INSERT INTO `order_shipping` VALUES ('5049841503455565', 'xiaoxiao', NULL, '15814623567', NULL, NULL, NULL, '深圳', NULL, '2019-06-23 21:53:31', '2019-06-23 21:53:31');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户id',
  `payment` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) NULL DEFAULT NULL COMMENT '支付类型，1、微信，2、支付宝',
  `status` int(5) NOT NULL COMMENT '状态：0、未付款，1、已付款，2、未发货，3、已发货，4、交易成功，5、交易关闭',
  `post_fee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  `order_mount` int(10) NULL DEFAULT NULL,
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime(0) NULL DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流单号',
  `buyer_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '买家留言',
  `buyer_rate` int(2) NULL DEFAULT NULL COMMENT '买家是否已经评价',
  `store_id` int(16) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `payment_type`(`payment_type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege`  (
  `priv_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(16) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `is_parent` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`priv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES (1, '系统后台管理', 'system', '', 0, '2018-11-11 22:10:57', '2018-11-11 22:11:00', 1);
INSERT INTO `privilege` VALUES (2, '角色管理', 'role-manage', 'admin/role', 1, '2018-11-11 22:12:16', '2018-11-24 20:32:19', 1);
INSERT INTO `privilege` VALUES (3, '店铺管理', 'store-manage', 'admin/store', 1, '2018-11-11 22:17:23', '2018-11-24 20:32:15', 1);
INSERT INTO `privilege` VALUES (4, '用户管理', 'user-manage', 'admin/user', 1, '2018-11-11 22:18:53', '2018-11-24 20:32:10', 1);
INSERT INTO `privilege` VALUES (5, '权限管理', 'privilege-manage', 'privilege', 1, '2018-11-11 22:19:18', '2018-11-19 20:54:53', 1);
INSERT INTO `privilege` VALUES (6, '添加角色', 'role-add', 'admin/role/addition', 2, '2018-11-11 22:19:45', '2018-11-19 10:27:02', 0);
INSERT INTO `privilege` VALUES (7, '角色列表', 'role-list', 'admin/role/list', 2, '2018-11-11 22:20:14', '2018-11-18 23:10:41', 0);
INSERT INTO `privilege` VALUES (8, '角色修改', 'role-edit', 'admin/role/edit', 2, '2018-11-11 22:20:36', '2018-11-18 23:10:48', 0);
INSERT INTO `privilege` VALUES (9, '角色删除', 'role-delete', 'admin/role/deletion', 2, '2018-11-11 22:23:13', '2018-11-18 23:10:57', 0);
INSERT INTO `privilege` VALUES (10, '店铺列表', 'store-list', 'admin/store/list', 3, '2018-11-11 22:23:50', '2018-11-18 23:11:04', 0);
INSERT INTO `privilege` VALUES (11, '店铺添加', 'store-add', 'admin/store/addition', 3, '2018-11-11 22:24:47', '2018-11-18 23:11:12', 0);
INSERT INTO `privilege` VALUES (12, '店铺修改', 'store-edit', 'admin/store/edit', 3, '2018-11-11 22:25:41', '2018-11-18 23:11:18', 0);
INSERT INTO `privilege` VALUES (13, '店铺删除', 'store-delete', 'admin/store/deletion', 3, '2018-11-11 22:26:25', '2018-11-18 23:11:25', 0);
INSERT INTO `privilege` VALUES (14, '用户修改', 'user-edit', 'admin/user/edit', 4, '2018-11-11 22:27:06', '2018-11-18 23:11:33', 0);
INSERT INTO `privilege` VALUES (15, '用户删除', 'user-delete', 'admin/user/deletion', 4, '2018-11-11 22:28:21', '2018-11-26 21:12:37', 0);
INSERT INTO `privilege` VALUES (16, '用户列表', 'user-list', 'admin/user/list', 4, '2018-11-11 22:28:41', '2018-11-18 23:12:03', 0);
INSERT INTO `privilege` VALUES (17, '用户添加', 'user-add', 'admin/user/addition', 4, '2018-11-11 22:29:04', '2018-11-18 23:12:10', 0);
INSERT INTO `privilege` VALUES (18, '权限添加', 'privilege-add', 'admin/privilege/addition', 5, '2018-11-11 22:30:05', '2018-11-18 23:22:52', 0);
INSERT INTO `privilege` VALUES (19, '权限列表', 'privilege-list', 'admin/privilege/list', 5, '2018-11-11 22:40:35', '2018-11-18 23:23:01', 0);
INSERT INTO `privilege` VALUES (20, '权限修改', 'privilege-edit', 'admin/privilege/edit', 5, '2018-11-11 22:41:02', '2018-11-18 23:23:30', 0);
INSERT INTO `privilege` VALUES (21, '权限删除', 'privilege-delete', 'admin/privilege/deletion', 5, '2018-11-11 22:41:34', '2018-11-18 23:23:19', 0);
INSERT INTO `privilege` VALUES (32, '菜品管理', 'book-manage', 'admin/product', 1, '2018-11-19 20:53:08', '2018-11-24 20:32:05', 1);
INSERT INTO `privilege` VALUES (33, '菜品添加上架', 'book-add', 'product/addition', 32, '2018-11-19 20:53:12', '2018-11-21 20:41:33', 0);
INSERT INTO `privilege` VALUES (34, '菜品编辑', 'book-edit', 'product/edit', 32, '2018-11-19 20:56:48', '2018-11-19 20:57:44', 0);
INSERT INTO `privilege` VALUES (35, '菜品下架', 'book-shelf', 'admin/product/shelf', 32, '2018-11-19 20:57:49', '2018-11-25 23:33:47', 0);
INSERT INTO `privilege` VALUES (36, '菜品查询', 'book-query', 'product/query', 32, '2018-11-19 20:59:52', '2018-11-19 21:01:48', 0);
INSERT INTO `privilege` VALUES (39, '个人中心', 'personal-center', 'admin/personal', 1, '2018-11-23 16:06:51', '2018-11-24 20:32:26', 1);
INSERT INTO `privilege` VALUES (40, '我的信息', 'person-info', '/admin/user/edti', 39, '2018-11-23 16:08:53', '2018-11-23 16:13:45', 0);
INSERT INTO `privilege` VALUES (42, '我的店铺', 'person-store', '/admin/store/edit', 39, '2018-11-23 16:10:01', '2018-11-23 16:11:09', 0);
INSERT INTO `privilege` VALUES (43, '我的菜品', 'person-book-list', '/admin/product/list', 39, '2018-11-23 16:11:54', '2018-11-23 16:13:38', 0);
INSERT INTO `privilege` VALUES (44, '订单管理', 'order-manage', 'admin/order', 1, '2018-11-24 20:31:14', '2018-11-24 20:31:47', 1);
INSERT INTO `privilege` VALUES (45, '订单列表', 'order-list', 'admin/order/list', 44, '2018-11-24 20:31:16', '2018-11-24 20:32:54', 0);
INSERT INTO `privilege` VALUES (46, '订单修改', 'order-edit', 'admin/order/edit', 44, '2018-11-24 20:32:58', '2018-11-24 20:33:28', 0);
INSERT INTO `privilege` VALUES (47, '订单删除', 'order-delete', 'admin/order/deletion', 44, '2018-11-24 20:33:31', '2018-11-24 20:34:02', 0);
INSERT INTO `privilege` VALUES (49, '菜品删除', 'book-delete', 'admin/product/deletion', 32, '2018-11-25 23:32:31', '2018-11-25 23:32:51', 0);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `cate_id` int(16) NOT NULL AUTO_INCREMENT,
  `parent_id` int(16) NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `sort_order` int(4) NULL DEFAULT NULL,
  `is_parent` tinyint(1) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`cate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (2, NULL, '新鲜蔬菜', 1, 1, 0, '2018-11-01 09:43:46', '2018-11-01 09:43:49');
INSERT INTO `product_category` VALUES (3, NULL, '时令水果', 1, 1, 0, '2018-11-01 09:46:08', '2018-11-01 09:46:11');
INSERT INTO `product_category` VALUES (4, NULL, '水产海鲜', 1, 1, 0, '2018-11-01 09:46:33', '2018-11-01 09:46:35');
INSERT INTO `product_category` VALUES (5, NULL, '品质肉禽蛋', 1, 1, 0, '2018-11-01 09:47:09', '2018-11-01 09:47:12');

-- ----------------------------
-- Table structure for product_desc
-- ----------------------------
DROP TABLE IF EXISTS `product_desc`;
CREATE TABLE `product_desc`  (
  `product_id` int(11) NOT NULL,
  `product_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_desc
-- ----------------------------
INSERT INTO `product_desc` VALUES (1, '<p><br/><a href=\"http://store.dangdang.com/gys_04099_dytg\" style=\"color: rgb(26, 102, 179); font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/ueditor/jsp/upload/image/20181124/1543065820217043526.jpg\"/></a></p>', '2018-11-24 21:23:43', '2019-06-16 11:13:18');
INSERT INTO `product_desc` VALUES (2, NULL, '2019-06-16 16:12:32', '2019-06-16 16:12:32');
INSERT INTO `product_desc` VALUES (3, NULL, '2019-06-16 11:11:20', '2019-06-16 11:11:20');
INSERT INTO `product_desc` VALUES (190, '<p>该西红柿来自 新西兰进口，真好吃啊，真好吃<br/></p>', '2019-06-15 18:10:46', '2019-06-16 16:16:38');
INSERT INTO `product_desc` VALUES (191, '<h1 style=\"margin: 0px; padding: 0px 0px 0.2em; font-size: 16px; font-family: &quot;microsoft yahei&quot;; line-height: 1; white-space: normal; background-color: rgb(255, 255, 255);\">云南特产高原新鲜红皮小土豆黄心农家自种10斤带箱迷你马铃薯洋芋</h1><p><br/></p>', '2019-06-16 19:38:54', '2019-06-16 19:38:54');
INSERT INTO `product_desc` VALUES (192, '<h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">长茄新鲜蔬菜长茄紫黑色茄子现摘现发农家</h3><p><br/></p>', '2019-06-16 19:42:29', '2019-06-16 19:42:29');
INSERT INTO `product_desc` VALUES (193, '<p><span style=\"color: rgb(0, 0, 0);\">云南新鲜老南瓜宝宝辅食农家老品种红皮甜南瓜</span></p>', '2019-06-16 19:46:23', '2019-07-07 22:20:27');
INSERT INTO `product_desc` VALUES (194, '<p>农家自养土鸡</p>', '2019-06-16 19:48:05', '2019-06-16 19:48:05');
INSERT INTO `product_desc` VALUES (195, '<p>新鲜车厘子</p>', '2019-06-16 20:02:05', '2019-06-16 20:02:05');
INSERT INTO `product_desc` VALUES (196, '<p>新鲜生蚝</p>', '2019-06-16 20:11:45', '2019-06-16 20:11:45');
INSERT INTO `product_desc` VALUES (197, '<p>222ee</p>', '2019-07-13 20:11:26', '2019-07-13 20:11:26');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `product_id` int(16) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(16) NULL DEFAULT NULL,
  `store_id` int(16) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `detail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `pages` int(10) NULL DEFAULT NULL COMMENT '总页数',
  `catalog` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录',
  `market_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价\\定价',
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `deal_mount` int(10) NULL DEFAULT NULL COMMENT '成交量',
  `look_mount` int(10) NULL DEFAULT NULL COMMENT '浏览量',
  `discount` decimal(5, 2) NULL DEFAULT NULL,
  `image_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `store_mount` int(10) NULL DEFAULT NULL COMMENT '库存数量',
  `store_time` datetime(0) NULL DEFAULT NULL COMMENT '入库时间',
  `pack_style` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封装方式',
  `is_shelf` int(2) NULL DEFAULT NULL COMMENT '是否上架',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `product_category_id`(`product_category_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1, 5, 1, '土鸡蛋', '正宗土鸡蛋农家散养新鲜农村自养天然鸡蛋', '', 11.50, NULL, '', 10.00, NULL, 202, 214, 11.50, 'upload/images/jiDan.jpg', 197, '2018-11-01 14:58:43', '', 1);
INSERT INTO `product_info` VALUES (2, 5, 1, '鸭蛋', '鸭蛋鸭蛋真好吃', '鸭蛋鸭蛋真好吃', 20.00, NULL, '', 24.00, NULL, 300, 311, 8.30, 'upload/images/yadan.jpg', 200, '2018-11-01 14:58:44', '', 1);
INSERT INTO `product_info` VALUES (3, 4, 1, '新鲜大虾', '新鲜大虾非常新鲜啊', NULL, 30.00, NULL, NULL, 25.00, NULL, 200, 200, 12.00, 'upload/images/abe39cb84cdf4a31.jpg', 20, NULL, NULL, 1);
INSERT INTO `product_info` VALUES (190, 2, 1, '西红柿', '红红的西红柿真好吃', NULL, 5.00, NULL, NULL, 4.90, NULL, 100, 111, 10.20, 'upload/images/xihongshi.jpg', 20, '2019-06-15 18:10:43', '', 1);
INSERT INTO `product_info` VALUES (191, 2, 1, '土豆', '云南特产高原新鲜红皮小土豆黄心农家自种10斤带箱迷你马铃薯洋芋', NULL, 5.00, NULL, NULL, 6.00, NULL, 100, 103, 8.30, 'upload/images/2bcfa9b6327c4608.jpg', 300, '2019-06-16 19:38:48', '', 1);
INSERT INTO `product_info` VALUES (192, 2, 1, '茄子', '长茄新鲜蔬菜长茄紫黑色茄子现摘现发农家', NULL, 2.00, NULL, NULL, 1.50, NULL, 100, 104, 13.30, 'upload/images/94c9eb14942948af.jpg', 100, '2019-06-16 19:42:29', '', 1);
INSERT INTO `product_info` VALUES (193, 2, 1, '南瓜', '云南新鲜老南瓜宝宝辅食农家老品种红皮甜南瓜', NULL, 7.00, NULL, NULL, 8.00, NULL, 100, 105, 8.80, 'upload/images/product/547303ab786b42b3.jpg', 234, '2019-06-16 19:46:23', '', 1);
INSERT INTO `product_info` VALUES (194, 5, 1, '土鸡', '农家自养土鸡', NULL, 20.00, NULL, NULL, 25.00, NULL, 100, 102, 8.00, 'upload/images/bcad5a24761c4fe4.jpg', 20, '2019-06-16 19:48:05', '', 1);
INSERT INTO `product_info` VALUES (195, 3, 2, '车厘子', '新鲜车厘子', NULL, 40.00, NULL, NULL, 39.90, NULL, 100, 115, 10.00, 'upload/images/23b51bc9785b4f28.jpg', 100, '2019-06-16 20:02:05', '', 1);
INSERT INTO `product_info` VALUES (196, 4, 1, '生蚝', '新鲜生蚝', NULL, 20.00, NULL, NULL, 19.90, NULL, 100, 102, 10.10, 'upload/images/78be8511d2bb441d.jpg', 200, '2019-06-16 20:11:45', '', 1);
INSERT INTO `product_info` VALUES (197, 2, 1, '22', '22', NULL, 2.50, NULL, NULL, 2.00, NULL, 100, 100, 12.50, 'upload/images/product/56564668fd4942d6.jpg', 200, '2019-07-13 20:11:25', '', 1);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `reply_id` int(16) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(16) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `user_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin', '超级管理员，拥有所有权限', '2018-11-04 22:14:09', '2018-11-04 22:14:11');
INSERT INTO `role` VALUES (2, '普通用户', 'customer', '一般用户，买东西的', '2018-11-04 22:16:03', '2018-11-04 22:16:06');
INSERT INTO `role` VALUES (3, '商家', 'business', '个体商家、企业商家，卖家', '2018-11-04 22:17:54', '2018-11-04 22:17:57');
INSERT INTO `role` VALUES (5, '老板', 'boss', '最高领导人', '2018-11-18 17:50:42', '2018-11-18 17:50:44');
INSERT INTO `role` VALUES (6, '用户管理员', 'user-manager', '管理系统中的用户', '2018-11-21 20:48:00', '2018-11-21 20:48:04');
INSERT INTO `role` VALUES (7, '店铺管理员', 'store-manager', '管理在本站注册的店铺', '2018-11-21 20:48:45', '2018-11-21 20:48:47');
INSERT INTO `role` VALUES (8, 'VIP用户', 'vip-customer', 'VIP用户，买书有折扣', '2018-11-21 21:09:17', '2018-11-21 21:09:20');
INSERT INTO `role` VALUES (9, '角色权限管理员', 'role-privilege-manager', '管理角色权限信息', '2018-11-23 23:13:51', '2018-11-23 23:13:51');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege`  (
  `role_id` int(16) NOT NULL,
  `privilege_id` int(16) NOT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `privilege_id`) USING BTREE,
  INDEX `privilege_id`(`privilege_id`) USING BTREE,
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`priv_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES (1, 1, '2019-06-15 15:04:55', '2019-06-15 15:04:55');
INSERT INTO `role_privilege` VALUES (1, 2, '2019-06-15 15:04:55', '2019-06-15 15:04:55');
INSERT INTO `role_privilege` VALUES (1, 3, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 4, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 5, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 6, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 7, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 8, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 9, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 10, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 11, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 12, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 13, '2019-06-15 15:04:56', '2019-06-15 15:04:56');
INSERT INTO `role_privilege` VALUES (1, 14, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 15, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 16, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 17, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 18, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 19, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 20, '2019-06-15 15:04:57', '2019-06-15 15:04:57');
INSERT INTO `role_privilege` VALUES (1, 21, '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES (1, 32, '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES (1, 33, '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES (1, 34, '2019-06-15 15:04:58', '2019-06-15 15:04:58');
INSERT INTO `role_privilege` VALUES (1, 35, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 36, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 39, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 40, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 42, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 43, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 44, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 45, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 46, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 47, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (1, 49, '2019-06-15 15:04:59', '2019-06-15 15:04:59');
INSERT INTO `role_privilege` VALUES (3, 1, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 3, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 4, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 12, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 14, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 32, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 33, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 34, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 35, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 36, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (3, 39, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 40, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 42, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 43, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 44, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 45, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 46, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 47, '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES (3, 49, '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES (5, 1, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 2, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 3, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 4, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 5, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 6, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 7, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 8, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 9, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 10, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 11, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 12, '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES (5, 13, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 14, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 15, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 16, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 17, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 18, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 19, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 20, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 21, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 32, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 33, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 34, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 35, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 36, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 39, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 40, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 42, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 43, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 44, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 45, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 46, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 47, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (5, 49, '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES (6, 1, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 4, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 14, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 15, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 16, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 17, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 39, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 40, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 42, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (6, 43, '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES (7, 1, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 3, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 10, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 11, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 12, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 13, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 39, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 40, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 42, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (7, 43, '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES (9, 1, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 2, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 5, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 6, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 7, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 8, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 9, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 18, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 19, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 20, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 21, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 39, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 40, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 42, '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES (9, 43, '2018-11-23 23:14:15', '2018-11-23 23:14:15');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `store_id` int(16) NOT NULL AUTO_INCREMENT,
  `store_manager_id` int(16) NULL DEFAULT NULL,
  `store_phone_num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_position` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `zhifubao_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`, `store_position`) USING BTREE,
  INDEX `store_manager_id`(`store_manager_id`) USING BTREE,
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`store_manager_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, 2, '15814516280', '06685337781', '王老板的店铺', '深圳', '2019-07-13 20:41:04', '2019-07-13 20:41:05', NULL, 'upload/images/store/3f22fab5ae3340e1.jpg');
INSERT INTO `store` VALUES (2, 11, '15814516280', '10086', '曹老板的店铺', '深圳', '2018-11-23 23:57:51', '2018-11-23 23:57:51', NULL, 'upload/images/store/3f22fab5ae3340e1.jpg');


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份',
  `active` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户激活码',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '414882567@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号阿斯顿', '管理员', '1', NULL, '2018-11-11 20:14:23', '2018-10-30 17:45:32');
INSERT INTO `user` VALUES (2, 'zdd', '商家1', 'e10adc3949ba59abbe56e057f20f883e', '1', '414882567@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号1', '自由职业', '1', NULL, '2018-11-24 20:30:17', '2018-10-30 22:25:01');
INSERT INTO `user` VALUES (14, 'xiaoxiao', '买家1', 'e10adc3949ba59abbe56e057f20f883e', '1', '414882567@qq.com', '15814623567', NULL, '深圳', '深圳', '上班族', '1', NULL, '2018-11-24 22:47:47', '2018-11-24 22:47:45');



-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(16) NOT NULL,
  `role_id` int(16) NOT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, '2018-11-24 22:35:40', '2018-11-24 22:35:40');
INSERT INTO `user_role` VALUES (2, 3, '2019-06-15 15:08:16', '2019-06-15 15:08:16');
INSERT INTO `user_role` VALUES (14, 2, '2019-06-15 15:36:03', '2019-06-15 15:36:03');

SET FOREIGN_KEY_CHECKS = 1;
