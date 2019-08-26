<?php

namespace app\common\action\admin;

use app\common\action\notify\Note;
use app\facade\DbAdmin;
use app\facade\DbBanner;
use cache\Phpredis;
use Config;
use Env;
use think\Db;
use third\PHPTree;

class Banner extends CommonIndex {
    private $cmsCipherUserKey = 'adminpass'; //用户密码加密key

    private function redisInit() {
        $this->redis = Phpredis::getConn();
//        $this->connect = Db::connect(Config::get('database.db_config'));
    }

    /**
     * @param $page
     * @param $pageNum
     * @return array
     * @author rzc
     */
    public function getBanner($page, $pageNum) {
       $offset = ($page - 1) * $pageNum;
       $result = DbBanner::getBanner([],'*',false,'',$offset.','.$pageNum);
        return ['code' => '200', 'cms_con_id' => $result];
    }

 
}