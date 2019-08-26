<?php

namespace app\admin\controller;

use app\admin\AdminController;

class Banner extends AdminController {
    protected $beforeActionList = [
       'isLogin', //所有方法的前置操作
        // 'isLogin' => ['except' => 'login'], //除去login其他方法都进行isLogin前置操作
        //        'three'   => ['only' => 'hello,data'],//只有hello,data方法进行three前置操作
    ];

    /**
     * @api              {post} / 获取轮播
     * @apiDescription   getBanner
     * @apiGroup         admin_banner
     * @apiName          login
     * @apiParam (入参) {String} cms_con_id
     * @apiParam (入参) {String} page 页码
     * @apiParam (入参) {String} pageNum 条数
     * @apiSuccess (返回) {String} code 200:成功 / 3001:页码不能为空 / 3002:用户不存在 / 3003:密码错误 / 3004:登录失败
     * @apiSampleRequest /admin/banner/getBanner
     * @return array
     * @author zyr
     */
    public function getBanner() {
        $apiName  = classBasename($this) . '/' . __function__;
        $page    = trim($this->request->post('page'));
        $pageNum    = trim($this->request->post('pageNum'));
        $page = is_numeric($page) ? $page : 1;
        $pageNum = is_numeric($pageNum) ? $pageNum : 10;
        intval($page);
        intval($pageNum);
        $result = $this->app->banner->getBanner($page, $pageNum);
        // $this->apiLog($apiName, [$page, $pageNum], $result['code'], '');
        return $result;
    }

  
}