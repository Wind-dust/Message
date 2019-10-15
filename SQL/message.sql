-- ----------------------------
-- 核心权限表
-- ----------------------------

-- ----------------------------
-- Table structure for yx_admin
-- ----------------------------
DROP TABLE IF EXISTS `yx_admin`;
CREATE TABLE `yx_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `passwd` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `department` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户类型 1.后台管理员 2.超级管理员',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1.启用 2.停用',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_admin_permissions_group
-- ----------------------------
DROP TABLE IF EXISTS `yx_admin_permissions_group`;
CREATE TABLE `yx_admin_permissions_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权限分组id',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_group_id_admin_id`(`group_id`, `admin_id`, `delete_time`) USING BTREE,
  INDEX `index_admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB  CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员权限分组关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_admin_permissions_relation
-- ----------------------------
DROP TABLE IF EXISTS `yx_admin_permissions_relation`;
CREATE TABLE `yx_admin_permissions_relation`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `menu_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_group_id_menu_id_api_id`(`group_id`, `menu_id`, `api_id`, `delete_time`) USING BTREE
) ENGINE = InnoDB  CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户分组权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pz_log_image
-- ----------------------------
DROP TABLE IF EXISTS `yx_log_image`;
CREATE TABLE `yx_log_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上传者',
  `stype` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1.index 2.admin',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '状态1.完成 2.未完成 3.弃用',
  `image_path` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片路径',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_image_path`(`image_path`, `delete_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_menu
-- ----------------------------
DROP TABLE IF EXISTS `yx_menu`;
CREATE TABLE `yx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `level` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '菜单等级',
  `icon_image` char(60) NOT NULL DEFAULT '' COMMENT '未选中的菜单标题图',
  `select_image` char(60) NOT NULL DEFAULT '' COMMENT '选中的菜单标题图',
  `link` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='cms左侧菜单';

-- ----------------------------
-- Table structure for yx_permissions_group
-- ----------------------------
DROP TABLE IF EXISTS `yx_permissions_group`;
CREATE TABLE `yx_permissions_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组名称',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组描述',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_group_name`(`group_name`, `delete_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组名称' ROW_FORMAT = Dynamic;

-- ----------------------------
-- 业务功能表
-- ----------------------------

-- ----------------------------
-- Table structure for yx_banner
-- ----------------------------
DROP TABLE IF EXISTS `yx_banner`;
CREATE TABLE `yx_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(10) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '图片路径',
  `jump_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '跳转类型: 1路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页轮播表';

-- ----------------------------
-- Table structure for yx_solution
-- ----------------------------
DROP TABLE IF EXISTS `yx_solution`;
CREATE TABLE `yx_solution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`),
  KEY `title`(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='解决方案表';

-- ----------------------------
-- Table structure for yx_product
-- ----------------------------
DROP TABLE IF EXISTS `yx_product`;
CREATE TABLE `yx_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`),
  KEY `title`(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品中心';

-- ----------------------------
-- Table structure for yx_application_case
-- ----------------------------
DROP TABLE IF EXISTS `yx_application_case`;
CREATE TABLE `yx_application_case` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`),
  KEY `title`(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用案例';

-- ----------------------------
-- Table structure for yx_download_center
-- ----------------------------
DROP TABLE IF EXISTS `yx_download_center`;
CREATE TABLE `yx_download_center` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型 1，服务类；2，行业平台，3验证码，4综合SMS平台',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `down_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`),
  KEY `title`(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下载中心';

-- ----------------------------
-- Table structure for yx_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `yx_aboutus`;
CREATE TABLE `yx_aboutus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '展示标题图片路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `order`(`order`),
  KEY `title`(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关于我们';

-- ----------------------------
-- Table structure for yx_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `yx_guestbook`;
CREATE TABLE `yx_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '姓名',
  `unit` varchar(50) NOT NULL DEFAULT '' COMMENT '单位',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '座机',
  `qq` varchar(10) NOT NULL DEFAULT '' COMMENT 'QQ',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '留言',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '产品线:1,短信验证码；2，行业手机彩信，3，语言验证，4行业营销短信，5企业流量 6国际业务',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '邮箱',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='留言';

