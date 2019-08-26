DROP TABLE IF EXISTS `pz_diamondvips`;
CREATE TABLE `pz_diamondvips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分享钻石会员id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商店ID',
  `linkman` char(15) NOT NULL DEFAULT '' COMMENT 'boss姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已领取数量',
  `coupon_money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '被分享用户将获得活动商票',
  `redmoney_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商票状态 1:直接领取 2:分享激活后获得  ',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '使用类型 1:分享使用 2:绑定二维码链接',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:申请中 1:审核通过 2:不通过  3:次数已用完',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分享钻石会员机会表';

DROP TABLE IF EXISTS `pz_diamondvip_get`;
CREATE TABLE `pz_diamondvip_get` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '领取钻石会员id',
  `diamondvips_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享钻石会员id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  `share_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享者UID',
  `redmoney` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '被分享用户将获得活动商票',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `linkman` char(15) NOT NULL DEFAULT '' COMMENT '姓名',
  `redmoney_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商票状态 0:待发放 1:已发放 2:过期 ',
  `share_redmoney` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分享用户每次获得活动商票',
  `share_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '已分享激活次数 ',
  `redmoney_overtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商票到期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='领取钻石会员表';

DROP TABLE IF EXISTS `pz_diamondvip_binding`;
CREATE TABLE `pz_diamondvip_binding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '绑定ID',
  `diamondvips_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享钻石会员id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户UID',
  `share_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分享者UID',
  `code` char(40) NOT NULL DEFAULT '' COMMENT 'hash值',
  `coupon_money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '被分享用户将获得活动商票',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `linkman` char(15) NOT NULL DEFAULT '' COMMENT '姓名',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态 1:待绑定 2:已绑定  ',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='二维码绑定名额钻石VIP名额';

DROP TABLE IF EXISTS `pz_recommend`;
CREATE TABLE `pz_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `model_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '模板id 1:轮播banner 2:图标tips 3:专题模块推荐 4:新品上市 5:每周推荐 6:爆款推荐 7:应季推荐 8:时令推荐 9:买主推荐 10:专题商品推荐',
  `title` char(10) NOT NULL DEFAULT '' COMMENT '标题',
  `image_path` varchar(150) NOT NULL DEFAULT '' COMMENT '图片路径',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '关联上级ID',
  `jump_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '跳转类型: 1:专题 2:商品 3:路径',
  `jump_content` varchar(50) NOT NULL DEFAULT '' COMMENT '跳转内容',
  `show_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '展示类型: 1:图片 2:商品 ',
  `show_data` int(10) NOT NULL DEFAULT '0' COMMENT '展示商品ID',
  `show_days` tinyint(3) NOT NULL DEFAULT '1' COMMENT '展示每周天数',
  `tier` tinyint(3) NOT NULL DEFAULT '1' COMMENT '层级',
  `is_show` tinyint(3) NOT NULL DEFAULT '1' COMMENT '模块是否显示,1:显示,2:不显示',
  `model_order` int(10) NOT NULL DEFAULT '0' COMMENT '模板排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `model_id`(`model_id`), 
  KEY `parent_id`(`parent_id`), 
  KEY `show_data`(`show_data`), 
  KEY `model_order`(`model_order`), 
  KEY `tier`(`tier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页推荐显示表';

