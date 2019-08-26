/*
 Navicat Premium Data Transfer

 Source Server         : 开发服务器
 Source Server Type    : MariaDB
 Source Server Version : 100214
 Source Host           : 47.98.43.15:3306
 Source Schema         : pzlifenew

 Target Server Type    : MariaDB
 Target Server Version : 100214
 File Encoding         : 65001

 Date: 11/04/2019 10:51:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pz_admin
-- ----------------------------
DROP TABLE IF EXISTS `pz_admin`;
CREATE TABLE `pz_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `passwd` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `department` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型 1.后台管理员 2.超级管理员',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.启用 2.停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_admin_bank
-- ----------------------------
DROP TABLE IF EXISTS `pz_admin_bank`;
CREATE TABLE `pz_admin_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `abbrev` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行英文缩写名',
  `bank_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行全称',
  `icon_img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `bg_img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '背景图',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.启用 2.停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_abbrev`(`abbrev`) USING BTREE,
  UNIQUE INDEX `uniq_bank_name`(`bank_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台银行管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_admin_remittance
-- ----------------------------
DROP TABLE IF EXISTS `pz_admin_remittance`;
CREATE TABLE `pz_admin_remittance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `initiate_admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发起操作人',
  `audit_admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加类型 1.商票 2.佣金 3.积分',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收款账户',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.待审核 2.已审核 3.取消',
  `credit` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '收款金额',
  `message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细描述',
  `admin_message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核查看描述',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'cms 商票、佣金手动充值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_areas
-- ----------------------------
DROP TABLE IF EXISTS `pz_areas`;
CREATE TABLE `pz_areas`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `code` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '统计用区划代码',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '层级',
  `area_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_pid`(`pid`, `delete_time`) USING BTREE,
  INDEX `index_level`(`level`, `delete_time`) USING BTREE,
  INDEX `index_area_name`(`area_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '省市区关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_coupon
-- ----------------------------
DROP TABLE IF EXISTS `pz_coupon`;
CREATE TABLE `pz_coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券价',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 1.满减 2.商品券 3.抵扣(全场抵扣)',
  `is_superposition` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否可累计叠加 1.是 2.否',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '门店id',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `time_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效期类型 1.自领取开始计算 2.固定开始结束类型)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '有效期开始时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '有效期结束时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_diamondvip_binding
-- ----------------------------
DROP TABLE IF EXISTS `pz_diamondvip_binding`;
CREATE TABLE `pz_diamondvip_binding`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '绑定ID',
  `diamondvips_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享钻石会员id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户UID',
  `share_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享者UID',
  `code` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'hash值',
  `coupon_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '被分享用户将获得活动商票',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `linkman` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1:待绑定 2:已绑定  ',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '二维码绑定名额钻石VIP名额' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_diamondvip_get
-- ----------------------------
DROP TABLE IF EXISTS `pz_diamondvip_get`;
CREATE TABLE `pz_diamondvip_get`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '领取钻石会员id',
  `diamondvips_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享钻石会员id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户UID',
  `share_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分享者UID',
  `redmoney` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '被分享用户将获得活动商票',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `linkman` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `redmoney_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '商票状态 0:待发放 1:已发放 2:过期 ',
  `coupon_num` mediumint(8) NOT NULL DEFAULT 0 COMMENT '带发放优惠券数量 ',
  `redmoney_overtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商票到期时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '领取钻石会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_diamondvips
-- ----------------------------
DROP TABLE IF EXISTS `pz_diamondvips`;
CREATE TABLE `pz_diamondvips`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分享钻石会员id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户UID',
  `shopid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商店ID',
  `linkman` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'boss姓名',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已领取数量',
  `coupon_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '被分享用户将获得活动商票',
  `redmoney_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '商票状态 1:直接领取 2:分享激活后获得  ',
  `type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '使用类型 1:分享使用 2:绑定二维码链接',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态 0:申请中 1:审核通过 2:不通过  3:次数已用完',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享钻石会员机会表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods`;
CREATE TABLE `pz_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商id',
  `cate_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应商品三级分类id',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品类型 1.普通(正常发货)商品 2.虚拟商品',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主标题',
  `subtitle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '副标题',
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品标题图',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '上下架状态 1.上架 2.下架',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_goods_name`(`goods_name`, `delete_time`) USING BTREE,
  INDEX `index_image`(`image`, `delete_time`) USING BTREE,
  INDEX `index_supplier_id_cate_id`(`supplier_id`, `cate_id`, `delete_time`) USING BTREE,
  FULLTEXT INDEX `full_title`(`title`)
) ENGINE = InnoDB AUTO_INCREMENT = 1291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_attr`;
CREATE TABLE `pz_goods_attr`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spec_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品一级类目',
  `attr_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '二级类目(商品属性)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1754 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '二级规格属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_class
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_class`;
CREATE TABLE `pz_goods_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '父级分类',
  `type_name` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品分类名',
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '层级 1.一级 2.二级 3.三级',
  `order_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.启用  2.停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_type_name`(`type_name`, `delete_time`) USING BTREE,
  INDEX `index_pid_status`(`pid`, `status`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_class_image
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_class_image`;
CREATE TABLE `pz_goods_class_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '来源 1.全部 2.pc 3.app 4.微信',
  `class_id` int(10) UNSIGNED NOT NULL COMMENT '分类id',
  `order_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `image_path` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_class_id`(`class_id`, `delete_time`, `source_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_image`;
CREATE TABLE `pz_goods_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `source_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '来源 1.全部 2.pc 3.app 4.微信',
  `image_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片类型 1.详情图 2.轮播图',
  `order_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `image_path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片内容',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_image_path`(`image_path`) USING BTREE,
  INDEX `index_goods_id_ source_type_image_type`(`goods_id`, `source_type`, `image_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16904 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品图片库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_relation
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_relation`;
CREATE TABLE `pz_goods_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `spec_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一级类目id',
  `attr_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二级类目id',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_goods_id_attr_id`(`goods_id`, `attr_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2272 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品和类目属性关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_sku`;
CREATE TABLE `pz_goods_sku`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'skuid',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `freight_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模版',
  `market_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `retail_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '零售价',
  `cost_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `presell_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预售价开始时间',
  `presell_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预售价结束时间',
  `presell_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '预售价',
  `active_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '活动价',
  `active_start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动价开始时间',
  `active_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动价过期时间',
  `margin_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '其他运费成本',
  `integral_price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分售价',
  `weight` decimal(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '重量(用作计算运费)',
  `volume` decimal(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '体积(用作计算运费)',
  `spec` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'sku属性列表',
  `sku_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格详情图',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.有效 2.无效',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_goods_id`(`goods_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2594 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品sku库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_spec`;
CREATE TABLE `pz_goods_spec`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '类目id',
  `cate_id` int(10) UNSIGNED NOT NULL COMMENT '商品三级分类',
  `spe_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目名称',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '一级规格类目分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_subject
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_subject`;
CREATE TABLE `pz_goods_subject`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级',
  `subject` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专题名称',
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '层级 1.一级 2.二级 3.三级',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.开启 2停用',
  `order_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_subject_tier`(`subject`, `tier`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '专题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_subject_image
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_subject_image`;
CREATE TABLE `pz_goods_subject_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '专题id',
  `source_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '来源 1.全部 2.pc 3.app 4.微信',
  `order_by` tinyint(3) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `image_path` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片路径',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_subject_id_source_type`(`subject_id`, `source_type`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品专题图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_goods_subject_relation
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_subject_relation`;
CREATE TABLE `pz_goods_subject_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '专题id',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_goods_id_subject_id`(`goods_id`, `subject_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2583 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品专题关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_api
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_api`;
CREATE TABLE `pz_log_api`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `param` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1.index 2.admin',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求账号',
  `code` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '返回code',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Api请求日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_bonus
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_bonus`;
CREATE TABLE `pz_log_bonus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联的订单号',
  `from_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买用户id',
  `level_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发放分利的层级用户',
  `to_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收取分利的boss用户',
  `sku_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'skuid',
  `user_identity` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户身份1.普通,2.钻石会员3.创业店主4.boss合伙人',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品成交价(单个商品)',
  `margin_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际成交毛利(单个商品)',
  `result_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际得到分利(已乘以购买数量)',
  `layer` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分利层级 1.一层(75) 2.二层(75*15) 三层(75*15*15)',
  `sup_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商id',
  `buy_sum` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购买数量',
  `sku_json` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格详情列表',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '分利类型 1.推荐关系分利 2.店铺购买分利 ',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1:待结算 2:已经算  3:取消结算',
  `bonus_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分利分类 1:返利 2:经营性收益 3:渠道收益',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_order_no_status`(`order_no`, `status`) USING BTREE,
  INDEX `index_create_time_status`(`create_time`, `status`) USING BTREE,
  INDEX `index_to_uid_status_create_time`(`to_uid`, `status`, `create_time`) USING BTREE,
  INDEX `index_level_uid_bonus_type_status`(`level_uid`, `bonus_type`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分利发放日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_error
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_error`;
CREATE TABLE `pz_log_error`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错误日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_image
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_image`;
CREATE TABLE `pz_log_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上传者',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1.index 2.admin',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '状态1.完成 2.未完成 3.弃用',
  `image_path` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片路径',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_image_path`(`image_path`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21802 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_integral
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_integral`;
CREATE TABLE `pz_log_integral`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联的订单号',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '获得积分账户',
  `result_integral` int(11) NOT NULL DEFAULT 0 COMMENT '实际获得积分',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.带结算  2:已经算  3:取消结算',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型 1.分利 2.后台充值',
  `message` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分发放日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_invest
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_invest`;
CREATE TABLE `pz_log_invest`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '领取收益的uid',
  `target_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买boss的uid',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.审核中 2.财务审核通过 3.经理审核通过',
  `cost` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '佣金费用',
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联订单号',
  `message` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '招商代理收益日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_openboss
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_openboss`;
CREATE TABLE `pz_log_openboss`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '开通boss预扣金额',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开通人',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作管理员',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.已审 2.待审',
  `message` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台开通boss日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_order
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_order`;
CREATE TABLE `pz_log_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单Id',
  `source_status` tinyint(3) UNSIGNED NOT NULL COMMENT '变更前状态(order表的order_status)',
  `arrive_status` tinyint(3) UNSIGNED NOT NULL COMMENT '变更后状态',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '变更时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_order_id_source_status_arrive_status`(`order_id`, `source_status`, `arrive_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单状态更改日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_pay
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_pay`;
CREATE TABLE `pz_log_pay`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pay_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付单号',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付用户',
  `payment` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付类型 1.普通订单 2.购买会员订单 3.虚拟商品订单',
  `pay_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第三方支付方式 1.支付宝 2.微信 3.银联',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付金额(整数，支付价格*100)',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1.成功 2.未成功',
  `notifydata` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信通知数据',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付成功时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_pay_no`(`pay_no`, `delete_time`) USING BTREE,
  INDEX `index_order_id_payment`(`order_id`, `payment`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方支付日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_trading
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_trading`;
CREATE TABLE `pz_log_trading`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '交易账户',
  `trading_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '交易类型 1.商票 2.佣金',
  `change_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1.消费 2.取消订单退还 3.充值 4.层级分利 5.购买会员分利 6.提现 7.转商票 8.后台充值操作 9.后台开通boss预扣款 10.审核不通过退回',
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '交易金额',
  `befor_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '交易前金额',
  `after_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '交易后金额',
  `message` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid_trading_type_change_type_create_time`(`uid`, `trading_type`, `change_type`, `create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 679 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商票，佣金交易日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_transfer
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_transfer`;
CREATE TABLE `pz_log_transfer`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请人',
  `abbrev` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行英文缩写名',
  `bank_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行全称',
  `bank_card` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_add` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行支行',
  `bank_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行开户手机号',
  `user_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行开户人',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.待处理 2.已完成 3.取消',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型 1.佣金转商票 2.佣金提现',
  `wtype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '提现方式 1.银行 2.支付宝 3.微信',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '处理金额',
  `proportion` decimal(4, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '税率比例',
  `invoice` tinyint(4) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否提供发票 1:提供 2:不提供',
  `link_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '处理描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_link_mobile`(`link_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '佣金转账申请记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_vercode
-- ----------------------------
DROP TABLE IF EXISTS `pz_log_vercode`;
CREATE TABLE `pz_log_vercode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证码类型1.注册 2修改密码 3.快捷登录',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '验证码内容',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接收手机',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验证码发送日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_member_order
-- ----------------------------
DROP TABLE IF EXISTS `pz_member_order`;
CREATE TABLE `pz_member_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `from_uid` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '推荐人uid',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员id',
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户订单类型 1.钻石会员 2.boss ',
  `pay_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `pay_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付状态  1:待付款 2:取消 3:已关闭 4:已付款',
  `pay_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付类型 1.支付宝 2.微信 3.银联',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成订单时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_order_no`(`order_no`, `delete_time`) USING BTREE,
  INDEX `index_uid_user_type`(`uid`, `user_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钻石和boss支付订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_order_child
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_child`;
CREATE TABLE `pz_order_child`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总订单id',
  `express_money` decimal(6, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `supplier_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商id',
  `supplier_name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '供应商名称',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '子订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_order_express
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_express`;
CREATE TABLE `pz_order_express`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品关系表id',
  `express_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `express_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递key',
  `express_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递公司',
  `send_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货时间',
  `take_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_express_no_express_key`(`express_no`, `express_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品物流单分配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_goods`;
CREATE TABLE `pz_order_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `order_child_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '子订单',
  `sku_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'skuid',
  `sup_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商id',
  `goods_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品类型 1.普通(正常发货)商品 2.虚拟商品',
  `boss_uid` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'boss_uid(区分购买门店)',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品成交价',
  `margin_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际成交毛利',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `goods_num` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品成交数量',
  `sku_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格图',
  `sku_json` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格详情列表',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_order_child_id`(`order_child_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 413 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品对应关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_orders
-- ----------------------------
DROP TABLE IF EXISTS `pz_orders`;
CREATE TABLE `pz_orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成唯一订单号',
  `third_order_id` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方订单id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `order_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态   1:待付款 2:取消订单 3:已关闭 4:已付款 5:已发货 6:已收货 7:待评价 8:退款申请确认 9:退款中 10:退款成功',
  `order_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单金额(优惠金额+实际支付的金额)',
  `deduction_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商票抵扣金额',
  `pay_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付(第三方支付金额+商票抵扣金额)',
  `goods_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品金额',
  `discount_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `pay_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付类型 1.所有第三方支付 2.商票',
  `third_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '第三方支付金额',
  `third_pay_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '第三方支付类型1.支付宝 2.微信 3.银联 ',
  `linkman` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单联系人',
  `linkphone` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系人电话',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省id',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '市id',
  `area_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '区id',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '买家留言信息',
  `third_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '第三方支付时间',
  `pay_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成订单时间',
  `send_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货时间',
  `rece_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_order_no`(`order_no`, `delete_time`) USING BTREE,
  INDEX `index_uid_order_status`(`uid`, `order_status`) USING BTREE,
  INDEX `index_uid_create_time`(`create_time`, `uid`) USING BTREE,
  INDEX `index_uid_send_time`(`uid`, `send_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '总订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_recommend
-- ----------------------------
DROP TABLE IF EXISTS `pz_recommend`;
CREATE TABLE `pz_recommend`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `model_id` tinyint(3) NOT NULL DEFAULT 1 COMMENT '模板id 1:轮播banner 2:图标tips 3:专题模块推荐 4:新品上市 5:每周推荐 6:爆款推荐 7:应季推荐 8:时令推荐 9:买主推荐 10:专题商品推荐',
  `title` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片路径',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '关联上级ID',
  `jump_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '跳转类型: 1:专题 2:商品 3:路径',
  `jump_content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳转内容',
  `show_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '展示类型: 1:图片 2:商品 ',
  `show_data` int(10) NOT NULL DEFAULT 0 COMMENT '展示商品ID',
  `show_days` tinyint(3) NOT NULL DEFAULT 1 COMMENT '展示每周天数',
  `tier` tinyint(3) NOT NULL DEFAULT 1 COMMENT '层级',
  `is_show` tinyint(3) NOT NULL DEFAULT 1 COMMENT '模块是否显示,1:显示,2:不显示',
  `model_order` int(10) NOT NULL DEFAULT 0 COMMENT '模板排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `show_data`(`show_data`) USING BTREE,
  INDEX `model_order`(`model_order`) USING BTREE,
  INDEX `tier`(`tier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页推荐显示表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_shop_apply
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_apply`;
CREATE TABLE `pz_shop_apply`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `target_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被邀请人id',
  `target_uname` varchar(30) NOT NULL DEFAULT '' COMMENT '被邀请人昵称',
  `target_nickname` varchar(6) NOT NULL DEFAULT ''  COMMENT '被邀请人姓名',
  `target_sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '被邀请人性别 1.男2.女 ',
  `target_mobile` char(11) NOT NULL DEFAULT '' COMMENT '被邀请人手机号',
  `target_idcard` char(18) NOT NULL DEFAULT '' COMMENT '被邀请人身份证号',
  `refe_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邀请人id',
  `refe_uname` varchar(30) NOT NULL DEFAULT '' COMMENT '邀请人昵称',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '邀请人门店id',
  `refe_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被邀请成为店主类型1.创业店主2.boss合伙人',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '申请进度 1.提交申请  2:财务审核通过 3:经理审核通过 4 审核不通过',
  `message` varchar(100) NOT NULL DEFAULT '' COMMENT '回馈信息',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请时间',
  `finish_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '完成时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shop_id`, `create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开店邀请记录表(只有创业店主和boss才可以邀请别人)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_goods`;
CREATE TABLE `pz_shop_goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.上架 2.下架',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '上架时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺商品上架表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_shops
-- ----------------------------
DROP TABLE IF EXISTS `pz_shops`;
CREATE TABLE `pz_shops`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺到期时间',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺描述',
  `shop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺图片',
  `shop_right` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '店铺权利',
  `server_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客服电话',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '店铺状态 1.启用 2.停用 3.关闭',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开店时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_supplier
-- ----------------------------
DROP TABLE IF EXISTS `pz_supplier`;
CREATE TABLE `pz_supplier`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名字',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.启用 2.停用',
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详情',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_supplier_freight
-- ----------------------------
DROP TABLE IF EXISTS `pz_supplier_freight`;
CREATE TABLE `pz_supplier_freight`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供货商id',
  `stype` tinyint(3) UNSIGNED NOT NULL COMMENT '计价方式1.件数 2.重量 3.体积',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.启用 2.停用',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详情',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_supid`(`supid`, `status`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商快递模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_supplier_freight_area
-- ----------------------------
DROP TABLE IF EXISTS `pz_supplier_freight_area`;
CREATE TABLE `pz_supplier_freight_area`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `freight_detail_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模版详情id',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '市id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_freight_detail_id_city_id`(`freight_detail_id`, `city_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29640 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运费详情地区的价格关系表(按市id)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_supplier_freight_detail
-- ----------------------------
DROP TABLE IF EXISTS `pz_supplier_freight_detail`;
CREATE TABLE `pz_supplier_freight_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `freight_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模版',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费单价',
  `after_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '续件价格',
  `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '包邮价格',
  `unit_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '计价单位包邮价(重量按kg 体积按m³)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_freight_id`(`freight_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商快递模版运费详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_supplier_relation
-- ----------------------------
DROP TABLE IF EXISTS `pz_supplier_relation`;
CREATE TABLE `pz_supplier_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `freight_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商快递模版id',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_goods_id_freight_id`(`goods_id`, `freight_id`) USING BTREE,
  INDEX `index_freight_id`(`freight_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品和供应商快递模板的对应关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_address
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_address`;
CREATE TABLE `pz_user_address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省id',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '市id',
  `area_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '区级id',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认 1.是 2.否',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid_default`(`uid`, `default`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 549 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_balance_detail`;
CREATE TABLE `pz_user_balance_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商票出入明细',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商票使用详情',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户商票明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_bank`;
CREATE TABLE `pz_user_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联uid',
  `admin_bank_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '后台银行管理id',
  `bank_card` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_add` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行支行',
  `bank_mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行开户手机号',
  `user_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行开户人',
  `error_fields` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '错误字段,用,隔开（例如bank_card,bank_add）',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1.待处理 2.启用(审核通过) 3.停用 4.已处理 5.审核不通过 ',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  `message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '后台管理员处理回馈留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_uid_status`(`uid`, `status`) USING BTREE,
  INDEX `index_user_name`(`user_name`) USING BTREE,
  INDEX `index_bank_mobile`(`bank_mobile`) USING BTREE,
  INDEX `index_admin_bank_id`(`admin_bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户绑定银行卡信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_commission
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_commission`;
CREATE TABLE `pz_user_commission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cprice` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态   1.待处理 2.待结算 3.已结算  4.取消结算',
  `action_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '处理时间(脚本运行时间)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间(付款成功后)',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_create_time_status`(`create_time`, `status`) USING BTREE,
  INDEX `index_action_time_status`(`action_time`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户佣金订单结算表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_commission_detail
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_commission_detail`;
CREATE TABLE `pz_user_commission_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `commission_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '佣金订单结算表id',
  `order_goods_id` int(10) UNSIGNED NOT NULL COMMENT '对应的商品订单表id',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '佣金明细',
  `goods_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `sku_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '规格id',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品成交价',
  `goods_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku_json` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格详情',
  `settle_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '佣金商品明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_con
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_con`;
CREATE TABLE `pz_user_con`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `con_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_con_id`(`con_id`) USING BTREE,
  UNIQUE INDEX `uniq_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户con_id和uid关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_coupon`;
CREATE TABLE `pz_user_coupon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠价格',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 1.满减 2.商品券 3.抵扣(全场抵扣)',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `is_superposition` tinyint(3) UNSIGNED NOT NULL COMMENT '是否可累计叠加 1.是 2.否',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '门店id',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `is_use` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否使用 1.使用 2.未使用',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_image
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_image`;
CREATE TABLE `pz_user_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二维码类型 1.个人中心 2.店铺',
  `image` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '二维码路径',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_image`(`image`) USING BTREE,
  INDEX `index_uid_stype`(`uid`, `stype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户二维码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_read
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_read`;
CREATE TABLE `pz_user_read`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `unionid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信unionid',
  `view_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被浏览的用户',
  `read_count` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '浏览次数',
  `nick_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信头像',
  `view_identity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '被浏览的身份 1.普通,2.钻石会员3.创业店主4.boss合伙人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间(最后浏览时间)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_openid_view_uid`(`view_uid`, `openid`) USING BTREE,
  INDEX `index_view_uid`(`view_uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_recommend
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_recommend`;
CREATE TABLE `pz_user_recommend`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uid`(`uid`) USING BTREE,
  INDEX `index_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户推荐关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_relation`;
CREATE TABLE `pz_user_relation`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `is_boss` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否是boss 1.是 2.否',
  `relation` varchar(768) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '和boss的层级关系',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uid`(`uid`) USING BTREE,
  UNIQUE INDEX `uniq_relation`(`relation`) USING BTREE,
  INDEX `index_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_user_wxinfo
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_wxinfo`;
CREATE TABLE `pz_user_wxinfo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `openid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `platform` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'openid来源(1:小程序 2:公众号)',
  `openid_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属微信公众平台(1:品质生活/2:圆善科技)',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uid_openid`(`uid`, `openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户openid信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_users
-- ----------------------------
DROP TABLE IF EXISTS `pz_users`;
CREATE TABLE `pz_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `passwd` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型1.普通账户2.总店账户',
  `user_identity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户身份1.普通,2.钻石会员3.创业店主4.boss合伙人',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '用户性别 1.男 2.女 3.未确认',
  `nick_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信昵称',
  `true_name` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `brithday` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生日',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信头像',
  `unionid` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qq` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'qq账号',
  `idcard` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'email',
  `last_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `bindshop` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '绑定的所属店铺',
  `balance` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商票(余额)',
  `balance_freeze` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '商票是否冻结 1.冻结 2.未冻结',
  `commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '剩余佣金',
  `commission_freeze` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '佣金是否冻结 1.冻结 2.未冻结',
  `integral` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '剩余积分',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_unionid`(`unionid`, `delete_time`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `pzlifenew`.`pz_users` 
MODIFY COLUMN `integral` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余积分' AFTER `commission_freeze`,
ADD COLUMN `bounty` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '奖励金' AFTER `integral`,
ADD COLUMN `bounty_freeze` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '奖励金是否冻结 1.冻结 2.未冻结' AFTER `bounty`;

ALTER TABLE `pzlifenew`.`pz_log_trading` 
MODIFY COLUMN `trading_type` tinyint(3) UNSIGNED NOT NULL COMMENT '交易类型 1.商票 2.佣金 3.奖励金' AFTER `uid`;

ALTER TABLE `pzlifenew`.`pz_diamondvip_get` 
ADD COLUMN `source` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '钻石来源 1.接龙 2.网推兼职' AFTER `share_uid`,
ADD COLUMN `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '钻石身份是否激活 1.激活 2.未激活' AFTER `source`,
ADD COLUMN `bounty_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '分享用户奖励金否激活 1.激活 2.未激活' AFTER `source`,
ADD COLUMN `share_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钻石分享人数' AFTER `source`;

ALTER TABLE `pzlifenew`.`pz_member_order` 
ADD COLUMN `actype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动类型：1.无活动 2兼职网推' AFTER `uid`;

ALTER TABLE `pzlifenew`.`pz_log_transfer` 
MODIFY COLUMN `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型 1.佣金转商票 2.佣金提现 3.奖励金转商票 4. 奖励金提现' AFTER `status`,
MODIFY COLUMN `wtype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '提现方式 1.银行 2.支付宝 3.微信 4.商票' AFTER `stype`;

ALTER TABLE `pzlifenew`.`pz_log_trading` 
MODIFY COLUMN `change_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1.消费 2.取消订单退还 3.充值 4.层级分利 5.购买会员分利 6.提现 7.佣金转商票 8.后台充值操作 9.后台开通boss预扣款 10.审核不通过退回 11.老商城转入 12.奖励金转入' AFTER `trading_type`;

DROP TABLE IF EXISTS `pz_statistics_month`;
CREATE TABLE `pz_statistics_month` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'BOSSID',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '统计类型,钻石网推:diamondvipNetPush',
  `timekey` int(10) NOT NULL DEFAULT 0 COMMENT '关联时间索引',
  `count` int(10) NOT NULL DEFAULT 0 COMMENT '计数字段',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT 0 COMMENT '金额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1:待发放 2:已经发放  3:取消发放',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `typeidtypetimekey` (`typeid`,`type`,`timekey`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT='统计-月' ROW_FORMAT = Dynamic;


ALTER TABLE `pzlifenew`.`pz_log_pay` 
ADD COLUMN `prepay_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信prepay_id' AFTER `order_id`;
ALTER TABLE `pzlifenew`.`pz_orders` 
ADD COLUMN `order_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1:普通购物订单 2:线下活动订单' AFTER `third_order_id`;

DROP TABLE IF EXISTS `pz_trigger`;
CREATE TABLE `pz_trigger` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态  1:待审核 2:启用 3:停用',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `stop_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '停止时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器列表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `pz_message_template` ;
CREATE TABLE `pz_message_template` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '类型  1:短短信 2:长短信 3:彩信',
  `template` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息模板',
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态  1:待审核 2:启用 3:停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_type`(`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `pz_message_task`;
CREATE TABLE `pz_message_task` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '发送人群  1:所有会员 2:普通会员 3:钻石会员 4:创业店主 5:合伙人 .',
  `wtype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '任务类型 1.订单发货 2.订单退款 3.未付款订单提醒 4.营销类活动 5.定时任务 6.生日祝福 7.提现到账 8.钻石奖励金到账 ',
  `mt_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '短信模板id',
  `trigger_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发器id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '状态  1:待审核 2:启用 3:停用 4:已发送',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息任务' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `pz_commission_relshop`;
CREATE TABLE `pz_commission_relshop` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '佣金收益UID',
  `nickname` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '佣金收益者微信昵称',
  `target_uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '我推荐的商店拥有者UID',
  `target_nickname` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '我推荐的商店拥有者微信昵称',
  `cost` decimal(14,2) unsigned DEFAULT NULL COMMENT '佣金费用',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态  0:待发放 1:已经发放  2:取消发放',
  `timekey` int(10) NOT NULL DEFAULT '0' COMMENT '月份信息 例如 201703',
  `datetime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid_target_uid_timekey` (`uid`,`target_uid`,`timekey`) USING BTREE,
  KEY `uidtimekeystatus` (`timekey`,`status`,`datetime`) USING BTREE
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺关联收益(月份)' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `pz_offline_activities`;
CREATE TABLE `pz_offline_activities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动图片路径',
  `qrcode_path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '二维码图片路径',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动开始时间',
  `stop_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动停止时间',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线下活动表';

DROP TABLE IF EXISTS `pz_offline_activities_goods`;
CREATE TABLE `pz_offline_activities_goods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `active_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '活动id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `goods_id_active_id` (`goods_id`,`active_id`)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线下活动商品表';