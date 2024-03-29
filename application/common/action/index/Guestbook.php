<?php

namespace app\common\action\index;

use app\common\action\notify\Note;
use app\facade\DbGuestbook;
use cache\Phpredis;
use Config;
use Env;
use think\Db;
use third\PHPTree;

class Guestbook extends CommonIndex {
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
    public function getGuestbook($page, $pageNum, $id = 0) {
        $offset = ($page - 1) * $pageNum;
        if (!empty($id)) {
            $result = DbGuestbook::getGuestbook(['id' => $id], '*', true);
        }else{
            $result = DbGuestbook::getGuestbook([], '*', false, '', $offset . ',' . $pageNum);
        }
        
        return ['code' => '200', 'Guestbook' => $result];
    }

    public function addGuestbook($data) {
       
        Db::startTrans();
        try {
            $bId = DbGuestbook::addGuestbook($data); //添加后的商品i
            Db::commit();
            return ['code' => '200', 'goods_id' => $bId];
        } catch (\Exception $e) {
            Db::rollback();
            return ['code' => '3009'];
        }
    }

    public function updateGuestbook($id, $title = '', $image_path = '', $jump_content = '', $order = 0, $content = '') {
        $Guestbook = DbGuestbook::getGuestbook(['id' => $id], 'id,image_path', true);
        if (empty($Guestbook)) {
            return ['code' => '3001'];
        }
        if (!empty($title)) {
            $data['title'] = $title;
        }
        if (!empty($image_path)) {
            $data['image_path'] = $image_path;
        }
        if (!empty($jump_content)) {
            $data['jump_content'] = $jump_content;
        }
        if (!empty($order)) {
            $data['order'] = $order;
        }
        $logImage    = [];
        $oldLogImage = [];
        if (!empty($data['image_path'])) { //提交了图片
            $image    = filtraImage(Config::get('qiniu.domain'), $data['image_path']);
            $logImage = DbImage::getLogImage($image, 2); //判断时候有未完成的图片
            if (empty($logImage)) { //图片不存在
                return ['code' => '3010']; //图片没有上传过
            }
            $oldImage = $Guestbook['image_path'];
            $oldImage = filtraImage(Config::get('qiniu.domain'), $oldImage);
            if (!empty($oldImage)) { //之前有图片
                if (stripos($oldImage, 'http') === false) { //新版本图片
                    $oldLogImage = DbImage::getLogImage($oldImage, 1); //之前在使用的图片日志
                }
            }
            $data['image_path'] = $image;
        }
        Db::startTrans();
        try {
            $updateRes = DbGuestbook::editGuestbook($data, $id);
            if (!empty($logImage)) {
                DbImage::updateLogImageStatus($logImage, 1); //更新状态为已完成
            }
            if (!empty($oldLogImage)) {
                DbImage::updateLogImageStatus($oldLogImage, 3); //更新状态为弃用
            }
            if ($updateRes) {
                Db::commit();
                return ['code' => '200'];
            }
            Db::rollback();
            return ['code' => '3009']; //修改失败
        } catch (\Exception $e) {
            Db::rollback();
            return ['code' => '3009']; //修改失败
        }
    }
}