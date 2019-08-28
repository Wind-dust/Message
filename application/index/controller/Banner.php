<?php
namespace app\index\controller;
use app\index\MyController;

class Banner extends MyController {

    /**
     * @api              {post} / 轮播展示
     * @apiDescription   getBanner
     * @apiGroup         index_Banner
     * @apiName          getBanner
     * @apiParam (入参) {Number} [banner_id] 对应商品id
     * @apiParam (入参) {String} page 页码
     * @apiParam (入参) {String} pageNum 条数
     * @apiSuccess (返回) {String} code 200:成功 / 3000:未获取到数据 / 3002.type参数错误 / 3003.pid参数错误
     * @apiSampleRequest /index/banner/getBanner
     * @author rzc
     */
    public function getBanner() {
        $apiName  = classBasename($this) . '/' . __function__;
        $banner_id = trim($this->request->post('banner_id'));
        $page       = trim($this->request->post('page'));
        $pageNum    = trim($this->request->post('pageNum'));
        $page       = is_numeric($page) ? $page : 1;
        $pageNum    = is_numeric($pageNum) ? $pageNum : 10;
        $result   = $this->app->banner->getBanner($page, $pageNum,$banner_id);
        // $this->apiLog($apiName, [$Banner_id, $source], $result['code'], '');
        return $result;
    }

}
