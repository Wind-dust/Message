<?php

namespace app\common\db\product;

use app\common\model\Banner;
use think\Db;

class DbBanner {
    /**
     * @param $where
     * @param $field
     * @param $row
     * @param $orderBy
     * @param $limit
     * @return array
     * @author rzc
     */
    public function getBanner($where, $field, $row = false, $orderBy = '', $limit = '') {
        $obj = Banner::field($field)->where($where);
        return $this->getResult($obj, $row, $orderBy, $limit);
    }

 
    public function addBanner($data) {
        $Banner = new Banner;
        $Banner->save($data);
        return $labelLibrary->id;
    }

  
    private function getResult($obj, $row = false, $orderBy = '', $limit = '') {
        if (!empty($orderBy)) {
            $obj = $obj->order($orderBy);
        }
        if (!empty($limit)) {
            $obj = $obj->limit($limit);
        }
        if ($row === true) {
            $obj = $obj->findOrEmpty();
        } else {
            $obj = $obj->select();
        }
        return $obj->toArray();
    }
}