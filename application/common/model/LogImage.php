<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class LogImage extends Model {
    use SoftDelete;
    protected $pk = 'id';
    // 设置当前模型对应的完整数据表名称
    protected $table = 'yx_log_image';
    // 设置当前模型的数据库连接
    protected $connection = '';
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;//关闭update_time
    protected $type = [
        'create_time' => 'timestamp:Y-m-d H:i:s',//更新时间
    ];
    private $stype = [1 => 'index', 2 => 'admin'];

//    public function getStypeAttr($value) {
//        return $this->stype[$value];
//    }

    public function setStypeAttr($value) {
        if (!in_array($value, $this->stype)) {
            return $value;
        }
        $stype = array_flip($this->stype);
        return $stype[$value];
    }
}