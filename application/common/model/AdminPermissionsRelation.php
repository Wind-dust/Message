<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class AdminPermissionsRelation extends Model {
    use SoftDelete;
    protected $pk = 'id';
    // 设置当前模型对应的完整数据表名称
    protected $table = 'yx_admin_permissions_relation';
    // 设置当前模型的数据库连接
    protected $connection = '';
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;//关闭update_time
    protected $defaultSoftDelete = 0;
    protected $type = [
        'create_time' => 'timestamp:Y-m-d H:i:s',//变更时间
    ];

    // 模型初始化
    protected static function init() {
        //TODO:初始化内容
    }
}