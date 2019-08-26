/*
 Navicat Premium Data Transfer

 Source Server         : local-yahui
 Source Server Type    : MySQL
 Source Server Version : 100036
 Source Host           : dbs.yahui.dev:3306
 Source Schema         : demo_pzlive

 Target Server Type    : MySQL
 Target Server Version : 100036
 File Encoding         : 65001

 Date: 12/12/2018 20:46:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pz_areas
-- ----------------------------
DROP TABLE IF EXISTS `pz_areas`;
CREATE TABLE `pz_areas`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `areaName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isShow` tinyint(4) NOT NULL DEFAULT 1,
  `areaSort` int(11) NOT NULL DEFAULT 0,
  `areaKey` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaType` tinyint(4) NOT NULL DEFAULT 1,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`areaId`) USING BTREE,
  INDEX `isShow`(`isShow`, `dataFlag`) USING BTREE,
  INDEX `areaType`(`areaType`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 820304 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_attributes
-- ----------------------------
DROP TABLE IF EXISTS `pz_attributes`;
CREATE TABLE `pz_attributes`  (
  `attrId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsCatId` int(11) NOT NULL DEFAULT 0,
  `goodsCatPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attrName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attrType` tinyint(4) NOT NULL DEFAULT 0,
  `attrVal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `attrSort` int(11) NOT NULL DEFAULT 0,
  `isShow` tinyint(4) NULL DEFAULT 1,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`attrId`) USING BTREE,
  INDEX `shopId`(`goodsCatId`, `isShow`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_banks
-- ----------------------------
DROP TABLE IF EXISTS `pz_banks`;
CREATE TABLE `pz_banks`  (
  `bankId` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`bankId`) USING BTREE,
  INDEX `bankFlag`(`dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_brands
-- ----------------------------
DROP TABLE IF EXISTS `pz_brands`;
CREATE TABLE `pz_brands`  (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brandImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brandDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createTime` datetime(0) NOT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `sortNo` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`brandId`) USING BTREE,
  INDEX `brandFlag`(`dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_carts
-- ----------------------------
DROP TABLE IF EXISTS `pz_carts`;
CREATE TABLE `pz_carts`  (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `isCheck` tinyint(4) NOT NULL DEFAULT 1,
  `goodsId` int(11) NOT NULL DEFAULT 0,
  `goodsSpecId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `cartNum` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cartId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_cash_configs
-- ----------------------------
DROP TABLE IF EXISTS `pz_cash_configs`;
CREATE TABLE `pz_cash_configs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(4) NOT NULL DEFAULT 0,
  `targetId` int(11) NOT NULL,
  `accType` tinyint(4) NOT NULL DEFAULT 0,
  `accTargetId` int(11) NOT NULL DEFAULT 0,
  `accAreaId` int(11) NULL DEFAULT NULL,
  `accNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accUser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `targetType`(`targetType`, `targetId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_cash_draws
-- ----------------------------
DROP TABLE IF EXISTS `pz_cash_draws`;
CREATE TABLE `pz_cash_draws`  (
  `cashId` int(11) NOT NULL AUTO_INCREMENT,
  `cashNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `targetType` tinyint(4) NOT NULL DEFAULT 0,
  `targetId` int(11) NOT NULL DEFAULT 0,
  `money` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `accType` tinyint(4) NOT NULL DEFAULT 0,
  `accTargetName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accAreaName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accUser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cashSatus` tinyint(4) NOT NULL DEFAULT 0,
  `cashRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cashConfigId` int(11) NOT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`cashId`) USING BTREE,
  INDEX `targetType`(`targetType`, `targetId`) USING BTREE,
  INDEX `cashNo`(`cashNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_cat_brands
-- ----------------------------
DROP TABLE IF EXISTS `pz_cat_brands`;
CREATE TABLE `pz_cat_brands`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catId` int(11) NULL DEFAULT NULL,
  `brandId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catId`(`catId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_crons
-- ----------------------------
DROP TABLE IF EXISTS `pz_crons`;
CREATE TABLE `pz_crons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cronName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cronCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isEnable` tinyint(4) NOT NULL DEFAULT 0,
  `isRunning` tinyint(4) NOT NULL DEFAULT 0,
  `cronJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cronUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cronDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cronCycle` tinyint(4) NOT NULL DEFAULT 0,
  `cronDay` tinyint(4) NULL DEFAULT 1,
  `cronWeek` tinyint(4) NULL DEFAULT 0,
  `cronHour` tinyint(4) NULL DEFAULT NULL,
  `cronMinute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `runTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isRunSuccess` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_favorites
-- ----------------------------
DROP TABLE IF EXISTS `pz_favorites`;
CREATE TABLE `pz_favorites`  (
  `favoriteId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `favoriteType` tinyint(4) NOT NULL DEFAULT 0,
  `targetId` int(11) NOT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`favoriteId`) USING BTREE,
  UNIQUE INDEX `favoriteId`(`userId`, `favoriteType`, `targetId`) USING BTREE,
  INDEX `userId`(`userId`, `favoriteType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods`;
CREATE TABLE `pz_goods`  (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsSn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopId` int(11) NOT NULL,
  `goodsType` tinyint(4) NOT NULL DEFAULT 0,
  `marketPrice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `shopPrice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `warnStock` int(11) NOT NULL DEFAULT 0,
  `goodsStock` int(11) NOT NULL DEFAULT 0,
  `goodsUnit` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsTips` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isSale` tinyint(4) NOT NULL DEFAULT 1,
  `isBest` tinyint(4) NOT NULL DEFAULT 0,
  `isHot` tinyint(4) NOT NULL DEFAULT 0,
  `isNew` tinyint(4) NOT NULL DEFAULT 0,
  `isRecom` tinyint(4) NULL DEFAULT 0,
  `goodsCatIdPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsCatId` int(11) NOT NULL,
  `shopCatId1` int(11) NOT NULL,
  `shopCatId2` int(11) NOT NULL,
  `brandId` int(11) NULL DEFAULT 0,
  `goodsDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsStatus` tinyint(4) NOT NULL DEFAULT 0,
  `saleNum` int(11) NOT NULL DEFAULT 0,
  `saleTime` datetime(0) NOT NULL,
  `visitNum` int(11) NULL DEFAULT 0,
  `appraiseNum` int(11) NULL DEFAULT 0,
  `isSpec` tinyint(4) NOT NULL DEFAULT 0,
  `gallery` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goodsSeoKeywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `illegalRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `isFreeShipping` tinyint(4) NULL DEFAULT 0,
  `goodsSerachKeywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`goodsId`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `goodsStatus`(`goodsStatus`, `dataFlag`, `isSale`) USING BTREE,
  INDEX `goodsCatIdPath`(`goodsCatIdPath`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_appraises
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_appraises`;
CREATE TABLE `pz_goods_appraises`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL DEFAULT 0,
  `orderId` int(11) NOT NULL DEFAULT 0,
  `goodsId` int(11) NOT NULL DEFAULT 0,
  `goodsSpecId` int(11) NOT NULL DEFAULT 0,
  `userId` int(11) NOT NULL DEFAULT 0,
  `goodsScore` int(11) NOT NULL DEFAULT 0,
  `serviceScore` int(11) NOT NULL DEFAULT 0,
  `timeScore` int(11) NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopReply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isShow` tinyint(4) NOT NULL DEFAULT 1,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `replyTime` date NULL DEFAULT NULL,
  `orderGoodsId` int(10) UNSIGNED NOT NULL COMMENT '订单商品表Id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `goodsId`(`goodsId`, `goodsSpecId`, `dataFlag`, `isShow`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `orderGoodsId`(`orderGoodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_attributes
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_attributes`;
CREATE TABLE `pz_goods_attributes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `goodsId` int(11) NOT NULL,
  `attrId` int(11) NOT NULL,
  `attrVal` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `goodsId`(`goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_cats
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_cats`;
CREATE TABLE `pz_goods_cats`  (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `catName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isShow` tinyint(4) NOT NULL DEFAULT 1,
  `isFloor` tinyint(4) NOT NULL DEFAULT 1,
  `catSort` int(11) NOT NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `commissionRate` decimal(11, 2) NULL DEFAULT -1.00,
  `catImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subTitle` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '楼层副标题',
  `simpleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`catId`) USING BTREE,
  INDEX `parentId`(`parentId`, `isShow`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 366 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_consult
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_consult`;
CREATE TABLE `pz_goods_consult`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goodsId` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `userId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `consultType` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '咨询类别',
  `consultContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询内容',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '咨询时间',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家回复',
  `replyTime` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `dataFlag` tinyint(4) NULL DEFAULT 1 COMMENT '数据有效标志',
  `isShow` tinyint(4) NULL DEFAULT 1 COMMENT '是否显示数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_scores
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_scores`;
CREATE TABLE `pz_goods_scores`  (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL DEFAULT 0,
  `shopId` int(11) NOT NULL DEFAULT 0,
  `totalScore` int(11) NOT NULL DEFAULT 0,
  `totalUsers` int(11) NOT NULL DEFAULT 0,
  `goodsScore` int(11) NOT NULL DEFAULT 0,
  `goodsUsers` int(11) NOT NULL DEFAULT 0,
  `serviceScore` int(11) NOT NULL DEFAULT 0,
  `serviceUsers` int(11) NOT NULL DEFAULT 0,
  `timeScore` int(11) NOT NULL DEFAULT 0,
  `timeUsers` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`scoreId`) USING BTREE,
  INDEX `goodsId`(`goodsId`, `shopId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_goods_specs
-- ----------------------------
DROP TABLE IF EXISTS `pz_goods_specs`;
CREATE TABLE `pz_goods_specs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL DEFAULT 0,
  `goodsId` int(11) NOT NULL DEFAULT 0,
  `productNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `marketPrice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `specPrice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `specStock` int(11) NOT NULL DEFAULT 0,
  `warnStock` int(11) NOT NULL DEFAULT 0,
  `saleNum` int(11) NOT NULL DEFAULT 0,
  `isDefault` tinyint(4) NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopId`(`goodsId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_messages
-- ----------------------------
DROP TABLE IF EXISTS `pz_messages`;
CREATE TABLE `pz_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgType` tinyint(4) NOT NULL DEFAULT 0,
  `sendUserId` int(11) NOT NULL DEFAULT 0,
  `receiveUserId` int(11) NOT NULL DEFAULT 0,
  `msgContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msgStatus` tinyint(4) NOT NULL DEFAULT 0,
  `msgJson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receiveUserId`(`receiveUserId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_order_complains
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_complains`;
CREATE TABLE `pz_order_complains`  (
  `complainId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL DEFAULT 0,
  `complainType` tinyint(4) NOT NULL DEFAULT 1,
  `complainTargetId` int(11) NOT NULL DEFAULT 0,
  `respondTargetId` int(11) NOT NULL DEFAULT 0,
  `needRespond` tinyint(4) NOT NULL DEFAULT 0,
  `deliverRespondTime` datetime(0) NULL DEFAULT NULL,
  `complainContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `complainAnnex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complainStatus` tinyint(4) NOT NULL DEFAULT 0,
  `complainTime` datetime(0) NOT NULL,
  `respondContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `respondAnnex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `respondTime` datetime(0) NULL DEFAULT NULL,
  `finalResult` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `finalResultTime` datetime(0) NULL DEFAULT NULL,
  `finalHandleStaffId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`complainId`) USING BTREE,
  INDEX `complainStatus`(`complainStatus`) USING BTREE,
  INDEX `complainType`(`complainTargetId`, `complainType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_goods`;
CREATE TABLE `pz_order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `goodsId` int(11) NOT NULL,
  `goodsNum` int(11) NOT NULL DEFAULT 0,
  `goodsPrice` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `goodsSpecId` int(11) NULL DEFAULT 0,
  `goodsSpecNames` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extraJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goodsType` tinyint(4) NOT NULL DEFAULT 0,
  `commissionRate` decimal(11, 2) NULL DEFAULT 0.00,
  `goodsCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotionJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodsId`(`goodsId`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_order_refunds
-- ----------------------------
DROP TABLE IF EXISTS `pz_order_refunds`;
CREATE TABLE `pz_order_refunds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `refundTo` int(11) NOT NULL DEFAULT 0,
  `refundReson` int(11) NOT NULL DEFAULT 0,
  `refundOtherReson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backMoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `refundTradeNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refundRemark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refundTime` datetime(0) NULL DEFAULT NULL,
  `shopRejectReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refundStatus` tinyint(4) NOT NULL DEFAULT 0,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId_2`(`orderId`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_orders
-- ----------------------------
DROP TABLE IF EXISTS `pz_orders`;
CREATE TABLE `pz_orders`  (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shopId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderStatus` tinyint(4) NOT NULL DEFAULT -2,
  `goodsMoney` decimal(11, 2) NOT NULL,
  `deliverType` tinyint(4) NOT NULL DEFAULT 0,
  `deliverMoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `totalMoney` decimal(11, 2) NOT NULL,
  `realTotalMoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `payType` tinyint(4) NOT NULL DEFAULT 0,
  `payFrom` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isPay` tinyint(4) NOT NULL DEFAULT 0,
  `areaId` int(11) NOT NULL,
  `areaIdPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderScore` int(11) NOT NULL DEFAULT 0,
  `isInvoice` tinyint(4) NOT NULL DEFAULT 0,
  `invoiceClient` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderSrc` tinyint(4) NOT NULL DEFAULT 0,
  `needPay` decimal(11, 2) NULL DEFAULT 0.00,
  `payRand` int(11) NULL DEFAULT 1,
  `orderType` int(11) NULL DEFAULT 0,
  `isRefund` tinyint(4) NOT NULL DEFAULT 0,
  `isAppraise` tinyint(4) NULL DEFAULT 0,
  `cancelReason` int(11) NULL DEFAULT 0,
  `rejectReason` int(11) NULL DEFAULT 0,
  `rejectOtherReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isClosed` tinyint(4) NOT NULL DEFAULT 0,
  `goodsSearchKeys` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `orderunique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiveTime` datetime(0) NULL DEFAULT NULL,
  `deliveryTime` datetime(0) NULL DEFAULT NULL,
  `expressId` int(11) NULL DEFAULT NULL,
  `expressNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tradeNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `settlementId` int(11) NULL DEFAULT 0,
  `commissionFee` decimal(11, 2) NULL DEFAULT 0.00,
  `scoreMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `useScore` int(11) NULL DEFAULT 0,
  `orderCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'order',
  `extraJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `orderCodeTargetId` int(11) NULL DEFAULT 0,
  `noticeDeliver` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提醒发货 0:未提醒 1:已提醒',
  `invoiceJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票信息',
  `lockCashMoney` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '锁定提现金额',
  `payTime` datetime(0) NULL DEFAULT NULL,
  `isBatch` tinyint(4) NULL DEFAULT 0,
  `totalPayFee` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `shopId`(`shopId`, `dataFlag`) USING BTREE,
  INDEX `userId`(`userId`, `dataFlag`) USING BTREE,
  INDEX `isRefund`(`isRefund`) USING BTREE,
  INDEX `orderStatus`(`orderStatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_payments
-- ----------------------------
DROP TABLE IF EXISTS `pz_payments`;
CREATE TABLE `pz_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payDesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `payOrder` int(11) NULL DEFAULT 0,
  `payConfig` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enabled` tinyint(4) NULL DEFAULT 0,
  `isOnline` tinyint(4) NULL DEFAULT 0,
  `payFor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payCode`(`payCode`, `enabled`, `isOnline`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_privileges
-- ----------------------------
DROP TABLE IF EXISTS `pz_privileges`;
CREATE TABLE `pz_privileges`  (
  `privilegeId` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) NOT NULL,
  `privilegeCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `privilegeName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isMenuPrivilege` tinyint(4) NOT NULL DEFAULT 0,
  `privilegeUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `otherPrivilegeUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `isEnable` tinyint(4) NULL DEFAULT 1,
  PRIMARY KEY (`privilegeId`) USING BTREE,
  UNIQUE INDEX `privilegeCode`(`privilegeCode`) USING BTREE,
  INDEX `menuId`(`menuId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_roles
-- ----------------------------
DROP TABLE IF EXISTS `pz_roles`;
CREATE TABLE `pz_roles`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `privileges` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`roleId`) USING BTREE,
  INDEX `roleFlag`(`dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_settlements
-- ----------------------------
DROP TABLE IF EXISTS `pz_settlements`;
CREATE TABLE `pz_settlements`  (
  `settlementId` int(11) NOT NULL AUTO_INCREMENT,
  `settlementNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `settlementType` tinyint(4) NOT NULL DEFAULT 0,
  `shopId` int(11) NOT NULL,
  `settlementMoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `commissionFee` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `backMoney` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `settlementStatus` tinyint(4) NOT NULL DEFAULT 0,
  `settlementTime` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`settlementId`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE,
  INDEX `settlementStatus`(`settlementStatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_shop_cats
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_cats`;
CREATE TABLE `pz_shop_cats`  (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `isShow` tinyint(4) NOT NULL DEFAULT 1,
  `catName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catSort` int(11) NOT NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`catId`) USING BTREE,
  INDEX `parentId`(`isShow`, `dataFlag`) USING BTREE,
  INDEX `shopId`(`shopId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_shop_configs
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_configs`;
CREATE TABLE `pz_shop_configs`  (
  `configId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `shopTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopBanner` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopAds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shopAdsUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shopServicer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopHotWords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopStreetImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺街背景',
  `shopMoveBanner` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`configId`) USING BTREE,
  INDEX `shopId`(`shopId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_shop_freights
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_freights`;
CREATE TABLE `pz_shop_freights`  (
  `freightId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL,
  `areaId2` int(11) NOT NULL,
  `freight` int(11) NOT NULL DEFAULT 0,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`freightId`) USING BTREE,
  INDEX `shopId`(`shopId`, `areaId2`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_shop_users
-- ----------------------------
DROP TABLE IF EXISTS `pz_shop_users`;
CREATE TABLE `pz_shop_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL DEFAULT 0,
  `userId` int(11) NOT NULL DEFAULT 0,
  `roleId` int(11) NOT NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_shops
-- ----------------------------
DROP TABLE IF EXISTS `pz_shops`;
CREATE TABLE `pz_shops`  (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `shopSn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `userId` int(11) NOT NULL,
  `areaIdPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `areaId` int(11) NULL DEFAULT 0,
  `isSelf` tinyint(4) NOT NULL DEFAULT 0,
  `shopName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shopkeeper` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shopCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shopImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shopTel` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shopQQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopWangWang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bankId` int(11) NULL DEFAULT 0,
  `bankNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `bankUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isInvoice` tinyint(4) NOT NULL DEFAULT 0,
  `invoiceRemarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serviceStartTime` time(0) NOT NULL DEFAULT '08:30:00',
  `serviceEndTime` time(0) NOT NULL DEFAULT '22:30:00',
  `freight` int(11) NULL DEFAULT 0,
  `shopAtive` tinyint(4) NOT NULL DEFAULT 1,
  `shopStatus` tinyint(4) NOT NULL DEFAULT 1,
  `statusDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` date NULL DEFAULT NULL,
  `shopMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `lockMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `noSettledOrderNum` int(11) NULL DEFAULT 0,
  `noSettledOrderFee` decimal(11, 2) NULL DEFAULT 0.00,
  `paymentMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `bankAreaId` int(11) NULL DEFAULT 0,
  `bankAreaIdPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applyStatus` tinyint(4) NULL DEFAULT 0,
  `applyDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applyTime` datetime(0) NULL DEFAULT NULL,
  `applyStep` tinyint(4) NULL DEFAULT 1,
  `shopNotice` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺公告',
  `rechargeMoney` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '充值金额',
  `longitude` decimal(10, 7) NULL DEFAULT NULL,
  `latitude` decimal(10, 7) NULL DEFAULT NULL,
  `mapLevel` int(11) NULL DEFAULT 16,
  PRIMARY KEY (`shopId`) USING BTREE,
  INDEX `shopStatus`(`shopStatus`, `dataFlag`) USING BTREE,
  INDEX `areaIdPath`(`areaIdPath`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_spec_cats
-- ----------------------------
DROP TABLE IF EXISTS `pz_spec_cats`;
CREATE TABLE `pz_spec_cats`  (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsCatId` int(11) NOT NULL DEFAULT 0,
  `goodsCatPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isAllowImg` tinyint(4) NOT NULL DEFAULT 0,
  `isShow` tinyint(4) NOT NULL DEFAULT 1,
  `catSort` int(11) NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`catId`) USING BTREE,
  INDEX `shopId`(`goodsCatPath`, `dataFlag`) USING BTREE,
  INDEX `isShow`(`isShow`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_spec_items
-- ----------------------------
DROP TABLE IF EXISTS `pz_spec_items`;
CREATE TABLE `pz_spec_items`  (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `shopId` int(11) NOT NULL DEFAULT 0,
  `catId` int(11) NOT NULL DEFAULT 0,
  `goodsId` int(11) NOT NULL DEFAULT 0,
  `itemName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`itemId`) USING BTREE,
  INDEX `goodsId`(`goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_staffs
-- ----------------------------
DROP TABLE IF EXISTS `pz_staffs`;
CREATE TABLE `pz_staffs`  (
  `staffId` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secretKey` int(32) NOT NULL,
  `staffName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staffNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffPhoto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffRoleId` int(11) NOT NULL,
  `workStatus` tinyint(4) NOT NULL DEFAULT 1,
  `staffStatus` tinyint(4) NOT NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `lastTime` datetime(0) NULL DEFAULT NULL,
  `lastIP` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxOpenId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staffPhone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`staffId`) USING BTREE,
  INDEX `loginName`(`loginName`) USING BTREE,
  INDEX `staffStatus`(`staffStatus`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_sys_configs
-- ----------------------------
DROP TABLE IF EXISTS `pz_sys_configs`;
CREATE TABLE `pz_sys_configs`  (
  `configId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fieldName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `fieldCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fieldValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fieldType` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`configId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_user_address
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_address`;
CREATE TABLE `pz_user_address`  (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaIdPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `areaId` int(11) NOT NULL DEFAULT 0,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDefault` tinyint(4) NOT NULL DEFAULT 0,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`addressId`) USING BTREE,
  INDEX `userId`(`userId`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_user_ranks
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_ranks`;
CREATE TABLE `pz_user_ranks`  (
  `rankId` int(11) NOT NULL AUTO_INCREMENT,
  `rankName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startScore` int(11) NOT NULL DEFAULT 0,
  `endScore` int(11) NOT NULL DEFAULT 0,
  `userrankImg` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`rankId`) USING BTREE,
  INDEX `startScore`(`startScore`, `endScore`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_user_scores
-- ----------------------------
DROP TABLE IF EXISTS `pz_user_scores`;
CREATE TABLE `pz_user_scores`  (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `dataSrc` int(11) NOT NULL DEFAULT 0,
  `dataId` int(11) NOT NULL DEFAULT 0,
  `dataRemarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `scoreType` int(11) NOT NULL DEFAULT 0,
  `createTime` datetime(0) NOT NULL,
  PRIMARY KEY (`scoreId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `userId_2`(`userId`, `dataSrc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pz_users
-- ----------------------------
DROP TABLE IF EXISTS `pz_users`;
CREATE TABLE `pz_users`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginSecret` int(11) NOT NULL,
  `loginPwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userType` tinyint(4) NOT NULL DEFAULT 0,
  `userSex` tinyint(4) NULL DEFAULT 0,
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brithday` date NULL DEFAULT NULL,
  `userPhoto` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userQQ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPhone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `userScore` int(11) NULL DEFAULT 0,
  `userTotalScore` int(11) NULL DEFAULT 0,
  `lastIP` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastTime` datetime(0) NULL DEFAULT NULL,
  `userFrom` tinyint(4) NULL DEFAULT 0,
  `userMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `lockMoney` decimal(11, 2) NULL DEFAULT 0.00,
  `userStatus` tinyint(4) NOT NULL DEFAULT 1,
  `dataFlag` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(0) NOT NULL,
  `payPwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rechargeMoney` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '充值金额',
  `isInform` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `userStatus`(`userStatus`, `dataFlag`) USING BTREE,
  INDEX `loginName`(`loginName`) USING BTREE,
  INDEX `userPhone`(`userPhone`) USING BTREE,
  INDEX `userEmail`(`userEmail`) USING BTREE,
  INDEX `userType`(`userType`, `dataFlag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
