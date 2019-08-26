define({ "api": [
  {
    "type": "post",
    "url": "/",
    "title": "添加后台管理员",
    "description": "<p>addAdmin</p>",
    "group": "admin_admin",
    "name": "addAdmin",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>添加的用户名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "passwd",
            "description": "<p>默认为:123456</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": true,
            "field": "stype",
            "description": "<p>添加的管理员类型 1.管理员 2超级管理员  默认为:1</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:账号不能为空 / 3002:密码必须为6-16个任意字符 / 3003:只有root账户可以添加超级管理员 / 3004:该账号已存在 / 3006:添加失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addadmin"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 添加支持银行",
    "description": "<p>addAdminBank</p>",
    "group": "admin_admin",
    "name": "addAdminBank",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "icon_img",
            "description": "<p>图标</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bg_img",
            "description": "<p>背景图</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 1.启用 2.停用(默认停用)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status或者status必须为数字 / 3002:错误的status  / 3003:abbrev和bank_name都不能为空 / 3004:abbrev和bank_name都不能为空重复 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addAdminBank"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "添加管理员到权限组",
    "description": "<p>addAdminPermissions</p>",
    "group": "admin_admin",
    "name": "addAdminPermissions",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>分组id</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "add_admin_id",
            "description": "<p>添加管理员id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组id错误 / 3003:权限分组不存在 /3004:添加用户不存在 / 3005:管理员id有误 / / 3006:该成员已存在 / 3007:添加失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addadminpermissions"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "添加接口权限列表",
    "description": "<p>addPermissionsApi</p>",
    "group": "admin_admin",
    "name": "addPermissionsApi",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "menu_id",
            "description": "<p>菜单id</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "api_name",
            "description": "<p>接口url</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "stype",
            "description": "<p>接口curd权限 1.增 2.删 3.改</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cn_name",
            "description": "<p>权限名称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>权限的详细描述</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:菜单id有误 / 3002:接口url不能为空 / 3003:接口权操作类型 /3004:权限名称不能为空 / 3005:接口已存在 / 3006:菜单不存在 / 3007:添加失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addpermissionsapi"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "添加权限分组",
    "description": "<p>addPermissionsGroup</p>",
    "group": "admin_admin",
    "name": "addPermissionsGroup",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>分组名称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>详细描述</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组名称错误 /3005:添加失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addpermissionsgroup"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "为权限组添加菜单接口",
    "description": "<p>addPermissionsGroupPower</p>",
    "group": "admin_admin",
    "name": "addPermissionsGroupPower",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>分组id</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "permissions",
            "description": "<p>权限分组:{&quot;1&quot;:{&quot;2&quot;:1,&quot;3&quot;:0},&quot;2&quot;:{&quot;4&quot;:1,&quot;5&quot;:0}}</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组id错误 / 3003:权限分组不存在 / 3004:权限分组不能为空 / 3005:permissions数据有误 / 3006:菜单不存在 / 3007:更改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/addpermissionsgrouppower"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 商券,佣金,积分手动充值",
    "description": "<p>adminRemittance</p>",
    "group": "admin_admin",
    "name": "adminRemittance",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "passwd",
            "description": "<p>用户密码</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "stype",
            "description": "<p>添加类型 1.商券 2.佣金 3.积分</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "nick_name",
            "description": "<p>前台用户昵称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>前台用户昵称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "credit",
            "description": "<p>收款金额(充值金额)</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>详细描述</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:密码错误 / 3002:请输入转入类型 / 3003:错误的转账类型 / 3004:充值用户不存在  / 3005:credit必须为数字 / 3006:扣款金额不能大于用户余额(商券) / 3007:充值用户昵称不能为空 / 3008:手机号格式错误</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/adminRemittance"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 审核商券,佣金,积分手动充值",
    "description": "<p>auditAdminRemittance</p>",
    "group": "admin_admin",
    "name": "auditAdminRemittance",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>1通过，2不通过</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status必须为数字 / 3003:不存在的记录  / 3004:已审核的状态无法再次审核 / 3005:空的status / 3006:错误的审核类型 / 3001:id必须为数字</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/auditAdminRemittance"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 管理员处理银行卡",
    "description": "<p>checkUserBank</p>",
    "group": "admin_admin",
    "name": "checkUserBank",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>后台管理员处理回馈留言</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 2.启用(审核通过)4.已处理 5.审核不通过</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "error_fields",
            "description": "<p>错误字段,用,隔开（例如bank_card,bank_add）  各个字段'bank_card','bank_add','bank_mobile','user_name'</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status或者id必须为数字 / 3002:错误的status  / 3003:id不能为空 / 3004:message不能为空（status传值为5） / 3005 错误的请求error_fields / 3006:已审核的银行卡或者用户停用的银行卡无法再次审核 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/checkUserBank"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 审核用户奖励金提现",
    "description": "<p>checkUserBountyTransfer</p>",
    "group": "admin_admin",
    "name": "checkUserBountyTransfer",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>后台管理员处理回馈留言</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 2.已完成 3.取消</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status或者id必须为数字 / 3002:错误的status  / 3003:id不能为空 / 3004:已审核的提现记录无法再次审核 / 3005 错误的请求error_fields / 3006:已审核的银行卡或者用户停用的银行卡无法再次审核 / 3007:审核失败 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/checkUserBountyTransfer"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 审核用户佣金提现",
    "description": "<p>checkUserCommissionTransfer</p>",
    "group": "admin_admin",
    "name": "checkUserCommissionTransfer",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>后台管理员处理回馈留言</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 2.已完成 3.取消</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status或者id必须为数字 / 3002:错误的status  / 3003:id不能为空 / 3004:已审核的提现记录无法再次审核 / 3005 错误的请求error_fields / 3006:已审核的银行卡或者用户停用的银行卡无法再次审核 / 3007:审核失败 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/checkUserCommissionTransfer"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms左侧菜单",
    "description": "<p>cmsMenu</p>",
    "group": "admin_admin",
    "name": "cmsMenu",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3002.type参数错误 / 3003.pid参数错误</p>"
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "type_name",
            "description": "<p>分类名称</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/cmsmenu"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms菜单详情",
    "description": "<p>cmsMenuOne</p>",
    "group": "admin_admin",
    "name": "cmsMenuOne",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": "<p>菜单id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001.菜单id有误</p>"
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "type_name",
            "description": "<p>分类名称</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/cmsmenuone"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "删除权限组的成员",
    "description": "<p>delAdminPermissions</p>",
    "group": "admin_admin",
    "name": "delAdminPermissions",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>分组id</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "del_admin_id",
            "description": "<p>要删除的admin_id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功  / 3001:分组id错误 / 3003:权限分组不存在 /3004:删除用户不存在 / 3005:管理员id有误 /3006:删除的管理员不存在 / 3007:删除失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/deladminpermissions"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 修改支持银行",
    "description": "<p>editAdminBank</p>",
    "group": "admin_admin",
    "name": "editAdminBank",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "icon_img",
            "description": "<p>图标</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bg_img",
            "description": "<p>背景图</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 1.启用 2.停用(默认停用)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status或者id必须为数字 / 3002:错误的status  / 3003:id不能为空 / 3004:没有更改的资料 / 3005:abbrev和bank_name都不能重复 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/editAdminBank"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 编辑提现比率",
    "description": "<p>editInvoice</p>",
    "group": "admin_admin",
    "name": "editInvoice",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "has_invoice",
            "description": "<p>提供发票</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "no_invoice",
            "description": "<p>不提供发票</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:no_invoice或者has_invoice或者status必须为数字 / 3002:比率不能超过100  / 3003:start_time时间格式错误  / 3004:end_time时间格式错误 / 3005:收款金额必须为数字 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/editInvoice"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "修改保存cms菜单",
    "description": "<p>editMenu</p>",
    "group": "admin_admin",
    "name": "editMenu",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": "<p>菜单id</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>菜单名称</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001.菜单id有误 / 3002:菜单id不存在 / 3003:修改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/editmenu"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "修改接口权限名称和详情",
    "description": "<p>editPermissionsApi</p>",
    "group": "admin_admin",
    "name": "editPermissionsApi",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cn_name",
            "description": "<p>权限名称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>权限的详细描述</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:接口id有误 /3004:权限名称不能为空 / 3005:接口不存在 / 3007:修改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/editpermissionsapi"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "修改权限分组",
    "description": "<p>editPermissionsGroup</p>",
    "group": "admin_admin",
    "name": "editPermissionsGroup",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>权限分组ID</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>分组名称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>详细描述</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组名称错误 / 3003:修改的用户不存在 / 3004:分组id错误 /3005:修改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/editpermissionsgroup"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 获取支持银行列表",
    "description": "<p>getAdminBank</p>",
    "group": "admin_admin",
    "name": "getAdminBank",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "id",
            "description": "<p>银行ID</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "status",
            "description": "<p>状态 1.启用 2.停用</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page",
            "description": "<p>当前页 默认1</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页数量 默认10</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:page或者pageNum或者status必须为数字 / 3002:错误的审核类型  / 3003:start_time时间格式错误  / 3004:end_time时间格式错误 / 3005:收款金额必须为数字 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getAdminBank"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取用户或所有的权限组列表",
    "description": "<p>getAdminGroup</p>",
    "group": "admin_admin",
    "name": "getAdminGroup",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "get_admin_id",
            "description": "<p>管理员id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:管理员id有误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>组名</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>描述</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getadmingroup"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取登录用户信息",
    "description": "<p>getAdminInfo</p>",
    "group": "admin_admin",
    "name": "getAdminInfo",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功  / 5000:请重新登录 2.5001:账号已停用</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": "<p>用户信息</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>管理员名</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "group",
            "description": "<p>所属权限组列表</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "stype",
            "description": "<p>用户类型 1.后台管理员 2.超级管理员</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getadmininfo"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 获取充值记录",
    "description": "<p>getAdminRemittance</p>",
    "group": "admin_admin",
    "name": "getAdminRemittance",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "initiate_admin_id",
            "description": "<p>发起操作人</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "audit_admin_id",
            "description": "<p>审核人</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "status",
            "description": "<p>1.待审核 2.已审核 3.取消</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "min_credit",
            "description": "<p>最小收款金额</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "max_credit",
            "description": "<p>最大收款金额</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "uid",
            "description": "<p>收款账户id 前台用户加密ID</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "stype",
            "description": "<p>添加类型 1.商券 2.佣金 3.积分</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "start_time",
            "description": "<p>创建起始时间</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "end_time",
            "description": "<p>创建中止时间</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page",
            "description": "<p>当前页 默认1</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页数量 默认10</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:status必须为数字 / 3002:错误的审核类型 / 3003:start_time时间格式错误  / 3004:end_time时间格式错误 / 3005:收款金额必须为数字 apiSuccess (返回) {String} total 记录条数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getAdminRemittance"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取后台管理员信息",
    "description": "<p>getAdminUsers</p>",
    "group": "admin_admin",
    "name": "getAdminUsers",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功  / 5000:请重新登录 2.5001:账号已停用</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": "<p>用户信息</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>管理员名</p>"
          },
          {
            "group": "返回",
            "type": "data",
            "optional": false,
            "field": "stype",
            "description": "<p>用户类型 1.后台管理员 2.超级管理员</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getAdminUsers"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取权限组信息",
    "description": "<p>getGroupInfo</p>",
    "group": "admin_admin",
    "name": "getGroupInfo",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>管理员id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组id错误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>组名</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>描述</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getgroupinfo"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 获取提现比率",
    "description": "<p>getInvoice</p>",
    "group": "admin_admin",
    "name": "getInvoice",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:page或者pageNum或者status必须为数字 / 3002:错误的审核类型  / 3003:start_time时间格式错误  / 3004:end_time时间格式错误 / 3005:收款金额必须为数字</p>"
          },
          {
            "group": "返回",
            "type": "array",
            "optional": false,
            "field": "invoice",
            "description": "<p>记录条数</p>"
          }
        ],
        "invoice": [
          {
            "group": "invoice",
            "type": "String",
            "optional": false,
            "field": "has_invoice",
            "description": "<p>有发票比率</p>"
          },
          {
            "group": "invoice",
            "type": "String",
            "optional": false,
            "field": "no_invoice",
            "description": "<p>无发票比率</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getInvoice"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 获取提现记录",
    "description": "<p>getLogTransfer</p>",
    "group": "admin_admin",
    "name": "getLogTransfer",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "id",
            "description": "<p>提供ID默认查详情</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "bank_card",
            "description": "<p>银行卡号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "bank_mobile",
            "description": "<p>银行开户手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "user_name",
            "description": "<p>银行开户人</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "stype",
            "description": "<p>类型 1.佣金转商券 2.佣金提现 3.奖励金转商券 4. 奖励金提现</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "wtype",
            "description": "<p>提现方式 1.银行 2.支付宝 3.微信 4.商券</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "status",
            "description": "<p>状态 1.待处理 2.已完成 3.取消</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "invoice",
            "description": "<p>是否提供发票 1:提供 2:不提供</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "min_money",
            "description": "<p>用户转出最小金额</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "max_money",
            "description": "<p>用户转出最大金额</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page",
            "description": "<p>当前页 默认1</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页数量 默认10</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:con_id长度只能是28位 / 3002:con_id不能为空 / 3003:start_time时间格式错误  / 3004:end_time时间格式错误 / 3005:转出金额必须为数字 / 3006:银行卡输入错误 / 3007:查询ID必须为数字 / 3008:page和pageNum必须为数字 / 3009:invoice参数错误 / 3010:wtype参数错误 / 3011:stype参数错误 / 3012:status参数错误 apiSuccess (返回) {String} total 记录条数</p>"
          },
          {
            "group": "返回",
            "type": "array",
            "optional": false,
            "field": "log_transfer",
            "description": ""
          }
        ],
        "log_transfer": [
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "id",
            "description": "<p>id</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "uid",
            "description": "<p>id</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "bank_card",
            "description": "<p>银行卡号</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "bank_add",
            "description": "<p>银行支行</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "bank_mobile",
            "description": "<p>银行开户手机号</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "user_name",
            "description": "<p>银行开户人</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 1.待处理 2.已完成 3.取消</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "stype",
            "description": "<p>类型 1.佣金转商券 2.佣金提现</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "wtype",
            "description": "<p>提现方式 1.银行 2.支付宝 3.微信 4.商券</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "money",
            "description": "<p>转出处理金额</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "proportion",
            "description": "<p>税率比例</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "invoice",
            "description": "<p>是否提供发票 1:提供 2:不提供</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "link_mobile",
            "description": "<p>联系人</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>处理描述</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "real_money",
            "description": "<p>实际到账金额</p>"
          },
          {
            "group": "log_transfer",
            "type": "String",
            "optional": false,
            "field": "deduct_money",
            "description": "<p>扣除金额+</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getLogTransfer"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "开通boss列表",
    "description": "<p>getOpenBossList</p>",
    "group": "admin_admin",
    "name": "getOpenBossList",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": "<p>操作管理员</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "mobile",
            "description": "<p>开通账号手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "nick_name",
            "description": "<p>开通账号昵称</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": true,
            "field": "page",
            "description": "<p>当前页 默认1</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页数量 默认10</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:手机格式有误</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "all_count",
            "description": "<p>总记录数</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "all_page",
            "description": "<p>总页数</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "Decimal",
            "optional": false,
            "field": "money",
            "description": "<p>预扣款金额</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "nick_name",
            "description": "<p>开通人昵称</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>开通人手机号</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>开通管理员</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>描述</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getopenbosslist"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取接口权限列表",
    "description": "<p>getPermissionsApi</p>",
    "group": "admin_admin",
    "name": "getPermissionsApi",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>组名</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "menu_id",
            "description": "<p>所属菜单</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "stype",
            "description": "<p>权限类型 1.增 2.删 3.改</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "cn_name",
            "description": "<p>名称</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>描述</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getpermissionsapi"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取接口权限详情",
    "description": "<p>getPermissionsApiOne</p>",
    "group": "admin_admin",
    "name": "getPermissionsApiOne",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:接口id有误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "group_name",
            "description": "<p>组名</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "menu_id",
            "description": "<p>所属菜单</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "stype",
            "description": "<p>权限类型 1.增 2.删 3.改</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "cn_name",
            "description": "<p>名称</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>描述</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getpermissionsapione"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取权限组下的管理员",
    "description": "<p>getPermissionsGroupAdmin</p>",
    "group": "admin_admin",
    "name": "getPermissionsGroupAdmin",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": "<p>分组id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001:分组id错误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>名字</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getpermissionsgroupadmin"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取权限列表",
    "description": "<p>getPermissionsList</p>",
    "group": "admin_admin",
    "name": "getPermissionsList",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "group_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:分组id错误</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getpermissionslist"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "cms 获取用户提交银行卡信息",
    "description": "<p>getUserBank</p>",
    "group": "admin_admin",
    "name": "getUserBank",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "id",
            "description": "<p>传银行卡ID默认查看详情</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "bank_card",
            "description": "<p>银行卡号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "bank_mobile",
            "description": "<p>银行开户手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "user_name",
            "description": "<p>银行开户人</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "status",
            "description": "<p>状态 1.待处理 2.启用(审核通过) 3.停用 4.已处理 5.审核不通过</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page",
            "description": "<p>当前页 默认1</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页数量 默认10</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:page或者pageNum或者status必须为数字 / 3002:错误的审核类型  /3003:银行卡号输入错误</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "total",
            "description": "<p>记录条数</p>"
          },
          {
            "group": "返回",
            "type": "array",
            "optional": false,
            "field": "userbank",
            "description": ""
          }
        ],
        "userbank": [
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "uid",
            "description": "<p>关联uid</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "admin_bank_id",
            "description": "<p>后台银行管理id</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "bank_card",
            "description": "<p>银行卡号</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "bank_add",
            "description": "<p>银行支行</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "bank_mobile",
            "description": "<p>银行开户手机号</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "user_name",
            "description": "<p>银行开户人</p>"
          },
          {
            "group": "userbank",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>状态 1.待处理 2.启用(审核通过) 3.停用 4.已处理 5.审核不通过</p>"
          }
        ],
        "user_bank[admin_bank]": [
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "abbrev",
            "description": "<p>银行英文缩写名</p>"
          },
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "bank_name",
            "description": "<p>银行全称</p>"
          },
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "icon_img",
            "description": "<p>图标</p>"
          },
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "bg_img",
            "description": "<p>背景图</p>"
          },
          {
            "group": "user_bank[admin_bank]",
            "type": "string",
            "optional": false,
            "field": "status",
            "description": "<p>状态 1.启用 2.停用</p>"
          }
        ],
        "user_bank[users]": [
          {
            "group": "user_bank[users]",
            "type": "string",
            "optional": false,
            "field": "id",
            "description": "<p>用户id</p>"
          },
          {
            "group": "user_bank[users]",
            "type": "string",
            "optional": false,
            "field": "user_identity",
            "description": "<p>用户身份1.普通,2.钻石会员3.创业店主4.boss合伙人</p>"
          },
          {
            "group": "user_bank[users]",
            "type": "string",
            "optional": false,
            "field": "nick_name",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "user_bank[users]",
            "type": "string",
            "optional": false,
            "field": "avatar",
            "description": "<p>用户头像</p>"
          },
          {
            "group": "user_bank[users]",
            "type": "string",
            "optional": false,
            "field": "mobile",
            "description": "<p>用户注册手机号</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/getUserBank"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "后台登录",
    "description": "<p>login</p>",
    "group": "admin_admin",
    "name": "login",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "passwd",
            "description": "<p>密码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:账号密码不能为空 / 3002:用户不存在 / 3003:密码错误 / 3004:登录失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/login"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "修改密码",
    "description": "<p>midifyPasswd</p>",
    "group": "admin_admin",
    "name": "midifyPasswd",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "passwd",
            "description": "<p>用户密码</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "new_passwd1",
            "description": "<p>新密码</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "new_passwd2",
            "description": "<p>确认密码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:密码错误 / 3002:密码必须为6-16个任意字符 / 3003:老密码不能为空 / 3004:密码确认有误  / 3005:修改密码失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/midifypasswd"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "开通boss",
    "description": "<p>openBoss</p>",
    "group": "admin_admin",
    "name": "openBoss",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": "<p>操作管理员</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>开通账号手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "nick_name",
            "description": "<p>开通账号昵称</p>"
          },
          {
            "group": "入参",
            "type": "Decimal",
            "optional": false,
            "field": "money",
            "description": "<p>开通后扣除金额</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "message",
            "description": "<p>开通理由</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:手机格式有误 / 3002:账号昵称不能未空 / 3003:金额必须为数字 / 3004:扣除金额不能是负数 / 3006:用户不存在 / 3007:该用户已经是boss / 3008:开通失败 / 3009:boss正在申请中</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/admin/admin/openboss"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/admin/controller/Admin.php",
    "groupTitle": "admin_admin"
  },
  {
    "type": "post",
    "url": "/",
    "title": "查询短信记录",
    "description": "<p>getSms</p>",
    "group": "notify_note",
    "name": "getSms",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "phone",
            "description": "<p>手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "date",
            "description": "<p>日期Ymd</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:手机号格式有误 / 3002:日期不符合规范</p>"
          },
          {
            "group": "返回",
            "type": "json",
            "optional": false,
            "field": "data",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/notify/note/getSms"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/notify/controller/Note.php",
    "groupTitle": "notify_note"
  },
  {
    "type": "post",
    "url": "/",
    "title": "短信营销群发",
    "description": "<p>sendContent</p>",
    "group": "notify_note",
    "name": "sendContent",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "phones",
            "description": "<p>手机号</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "content",
            "description": "<p>短信内容</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:发送失败 / 3001:手机号格式有误 / 3002:短信内容不能为空</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/notify/note/sendcontent"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/notify/controller/Note.php",
    "groupTitle": "notify_note"
  },
  {
    "type": "post",
    "url": "/",
    "title": "短信验证码发送",
    "description": "<p>sendSms</p>",
    "group": "notify_note",
    "name": "sendSms",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "phone",
            "description": "<p>手机号</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "code",
            "description": "<p>验证码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:发送失败 / 3001:手机号格式有误</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/notify/note/sendSms"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/notify/controller/Note.php",
    "groupTitle": "notify_note"
  },
  {
    "type": "post",
    "url": "/",
    "title": "支付订单",
    "description": "<p>pay</p>",
    "group": "pay_wxpay",
    "name": "pay",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "order_no",
            "description": "<p>订单号</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "payment",
            "description": "<p>1.普通订单 2.购买会员订单 3.虚拟商品订单</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "platform",
            "description": "<p>环境 1.小程序 2.公众号(默认1)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:不存在需要支付的订单 / 3001.订单号错误 / 3002.订单类型错误 / 3004:订单已取消 / 3005:订单已关闭 / 3006:订单已付款 3007:订单已过期 / 3008:第三方支付已付款 / 3009:支付方式暂不支持 / 3010:创建支付订单失败 / 3011:code有误</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "parameters",
            "description": "<p>发起支付加密数据</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/pay/pay/pay"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/pay/controller/Pay.php",
    "groupTitle": "pay_wxpay"
  },
  {
    "type": "post",
    "url": "/",
    "title": "微信支付回调",
    "description": "<p>wxPayCallback</p>",
    "group": "pay_wxpay",
    "name": "wxPayCallback",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "order_no",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:未获取到数据 / 3001.skuid错误 / 3002.con_id错误 /3003:city_id必须为数字 / 3004:商品售罄 / 3005:商品未加入购物车 / 3006:商品不支持配送 3007:商品库存不够</p>"
          },
          {
            "group": "返回",
            "type": "Int",
            "optional": false,
            "field": "goods_count",
            "description": "<p>购买商品总数</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/pay/pay/wxPayCallback"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/pay/controller/Pay.php",
    "groupTitle": "pay_wxpay"
  },
  {
    "type": "post",
    "url": "/",
    "title": "删除商品详情和轮播图",
    "description": "<p>delPromoteImage</p>",
    "group": "supadmin_promote",
    "name": "delPromoteImage",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "image_path",
            "description": "<p>商品id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:图片不能为空 / 3002:图片不存在 / 3003:上传失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/promote/delPromoteImage"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Promote.php",
    "groupTitle": "supadmin_promote"
  },
  {
    "type": "post",
    "url": "/",
    "title": "活动图片详情",
    "description": "<p>getPromoteimagedetail</p>",
    "group": "supadmin_promote",
    "name": "getPromoteimagedetail",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "promote_id",
            "description": "<p>活动id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3002:promote_id不存在</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/promote/getPromoteimagedetail"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Promote.php",
    "groupTitle": "supadmin_promote"
  },
  {
    "type": "post",
    "url": "/",
    "title": "推广活动报名列表",
    "description": "<p>getSupPromoteSignUp</p>",
    "group": "supadmin_promote",
    "name": "getSupPromoteSignUp",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "promote_id",
            "description": "<p>活动ID</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "page",
            "description": "<p>页数</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页条数(默认10)</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "study_name",
            "description": "<p>姓名</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "study_mobile",
            "description": "<p>电话</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "sex",
            "description": "<p>性别 1男 2女</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "start_time",
            "description": "<p>开始时间</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": true,
            "field": "end_time",
            "description": "<p>结束时间</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:列表为空 / 3001:page错误 / 3002:promote_id错误 / 3003:时间格式错误 / 3004:性别格式错误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "study_name",
            "description": "<p>学员姓名</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "study_mobile",
            "description": "<p>学员手机号</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "sex",
            "description": "<p>性别 1男 2女</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "age",
            "description": "<p>年龄</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "signinfo",
            "description": "<p>报名内容</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "create_time",
            "description": "<p>报名时间</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/promote/getSupPromoteSignUp"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Promote.php",
    "groupTitle": "supadmin_promote"
  },
  {
    "type": "post",
    "url": "/",
    "title": "对商品图进行排序",
    "description": "<p>sortPromoteimagedetail</p>",
    "group": "supadmin_promote",
    "name": "sortImageDetail",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "image_path",
            "description": "<p>商品id</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "order_by",
            "description": "<p>排序</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:图片不能为空 / 3002:图片不存在 / 3003:排序字段只能为数字或者排序最大为999 / 3004:修改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/promote/sortPromoteimagedetail"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Promote.php",
    "groupTitle": "supadmin_promote"
  },
  {
    "type": "post",
    "url": "/",
    "title": "提交活动详情和轮播图",
    "description": "<p>uploadPromoteImages</p>",
    "group": "supadmin_promote",
    "name": "uploadPromoteImages",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "cms_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "image_type",
            "description": "<p>图片类型 1.详情图 2.轮播图</p>"
          },
          {
            "group": "入参",
            "type": "Number",
            "optional": false,
            "field": "promote_id",
            "description": "<p>活动id</p>"
          },
          {
            "group": "入参",
            "type": "Array",
            "optional": false,
            "field": "images",
            "description": "<p>图片集合</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:图片类型有误 / 3002:商品id只能是数字 / 3003:图片不能空 / 3004:商品id不存在 / 3005:图片没有上传过 / 3006:上传失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/promote/uploadPromoteImages"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Promote.php",
    "groupTitle": "supadmin_promote"
  },
  {
    "type": "post",
    "url": "/",
    "title": "上传单个图片",
    "description": "<p>uploadFile</p>",
    "group": "supadmin_upload",
    "name": "uploadFilee",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "file",
            "optional": false,
            "field": "image",
            "description": "<p>图片</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功  / 3001:上传的不是图片 / 3002:上传图片不能超过2M / 3003:上传失败 / 3004:上传文件不能为空</p>"
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": "<p>结果</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/upload/uploadfile"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/Upload.php",
    "groupTitle": "supadmin_upload"
  },
  {
    "type": "post",
    "url": "/",
    "title": "添加推广",
    "description": "<p>addPromote</p>",
    "group": "supadmin_user",
    "name": "addPromote",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "big_image",
            "description": "<p>大图</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "share_title",
            "description": "<p>微信转发分享标题</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "share_image",
            "description": "<p>微信转发分享图片</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "share_count",
            "description": "<p>需要分享次数</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bg_image",
            "description": "<p>分享成功页面图片</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:title不能为空 / 3002:share_title不能为空 / 3003:big_image未上传 / 3004:share_image未上传 / 3005:bg_image未上传 / 3006:big_image图片没有上传过 / 3007:share_image图片没有上传过 / 3008:bg_image图片没有上传过 / 3009:share_count有误 / 3010:添加失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/addpromote"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "编辑推广",
    "description": "<p>editPromote</p>",
    "group": "supadmin_user",
    "name": "editPromote",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "big_image",
            "description": "<p>大图</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "share_title",
            "description": "<p>微信转发分享标题</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "share_image",
            "description": "<p>微信转发分享图片</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "share_count",
            "description": "<p>需要分享次数</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "bg_image",
            "description": "<p>分享成功页面图片</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 /3000:推广活动不存在 / 3001:title不能为空 / 3002:share_title不能为空 / 3006:big_image图片没有上传过 / 3007:share_image图片没有上传过 / 3008:bg_image图片没有上传过 / 3009:share_count有误 / 3010:修改失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/editpromote"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "推广活动详情",
    "description": "<p>getPromoteInfo</p>",
    "group": "supadmin_user",
    "name": "getPromoteInfo",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:列表为空 / 3001:id错误 / 3002:详情id不存在</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "big_image",
            "description": "<p>大图</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "share_title",
            "description": "<p>微信转发分享标题</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "share_image",
            "description": "<p>微信转发分享图片</p>"
          },
          {
            "group": "data",
            "type": "Int",
            "optional": false,
            "field": "share_count",
            "description": "<p>需要分享次数</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "bg_image",
            "description": "<p>分享成功页面图片</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/getpromoteinfo"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "推广活动列表",
    "description": "<p>getPromoteList</p>",
    "group": "supadmin_user",
    "name": "getPromoteList",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": false,
            "field": "page",
            "description": "<p>页数</p>"
          },
          {
            "group": "入参",
            "type": "Int",
            "optional": true,
            "field": "page_num",
            "description": "<p>每页条数(默认10)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3000:列表为空 / 3001:page错误</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": ""
          }
        ],
        "data": [
          {
            "group": "data",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": ""
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>标题</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "big_image",
            "description": "<p>大图</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "share_title",
            "description": "<p>微信转发分享标题</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "share_image",
            "description": "<p>微信转发分享图片</p>"
          },
          {
            "group": "data",
            "type": "Int",
            "optional": false,
            "field": "share_count",
            "description": "<p>需要分享次数</p>"
          },
          {
            "group": "data",
            "type": "String",
            "optional": false,
            "field": "bg_image",
            "description": "<p>分享成功页面图片</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/getpromoteList"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "获取管理员信息",
    "description": "<p>getSupUser</p>",
    "group": "supadmin_user",
    "name": "getSupUser",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功  / 5000:请重新登录 2.5001:账号已停用</p>"
          },
          {
            "group": "返回",
            "type": "Array",
            "optional": false,
            "field": "data",
            "description": "<p>用户信息</p>"
          },
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "admin_name",
            "description": "<p>管理员名</p>"
          },
          {
            "group": "返回",
            "type": "data",
            "optional": false,
            "field": "stype",
            "description": "<p>用户类型 1.后台管理员 2.超级管理员</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/getsupuser"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "修改密码",
    "description": "<p>resetPassword</p>",
    "group": "supadmin_user",
    "name": "resetPassword",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "sup_con_id",
            "description": ""
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "passwd",
            "description": "<p>用户密码</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "new_passwd1",
            "description": "<p>新密码</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "new_passwd2",
            "description": "<p>确认密码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:密码错误 / 3002:密码必须为6-16个任意字符 / 3003:老密码不能为空 / 3004:密码确认有误  / 3005:修改密码失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/resetpassword"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  },
  {
    "type": "post",
    "url": "/",
    "title": "后台登录",
    "description": "<p>sup_login</p>",
    "group": "supadmin_user",
    "name": "sup_login",
    "parameter": {
      "fields": {
        "入参": [
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号</p>"
          },
          {
            "group": "入参",
            "type": "String",
            "optional": false,
            "field": "passwd",
            "description": "<p>密码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "返回": [
          {
            "group": "返回",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>200:成功 / 3001:手机号密码不能为空 / 3002:用户不存在 / 3003:密码错误 / 3004:登录失败</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:1004/supadmin/user/login"
      }
    ],
    "version": "0.0.0",
    "filename": "./application/supadmin/controller/User.php",
    "groupTitle": "supadmin_user"
  }
] });
