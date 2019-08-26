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
