<?php

namespace app\admin\controller;

use app\admin\AdminController;

class Product extends AdminController {
    protected $beforeActionList = [
        'isLogin', //所有方法的前置操作
        // 'isLogin' => ['except' => 'login'], //除去login其他方法都进行isLogin前置操作
        //        'three'   => ['only' => 'hello,data'],//只有hello,data方法进行three前置操作
    ];

    /**
     * @api              {post} / 获取产品类型
     * @apiDescription   getProduct
     * @apiGroup         admin_Product
     * @apiName          getProduct
     * @apiParam (入参) {String} cms_con_id
     * @apiParam (入参) {String} page 页码
     * @apiParam (入参) {String} pageNum 条数
     * @apiSuccess (返回) {String} code 200:成功 / 3001:页码不能为空 / 3002:用户不存在 / 3003:密码错误 / 3004:登录失败
     * @apiSampleRequest /admin/Product/getProduct
     * @return array
     * @author rzc
     */
    public function getProduct() {
        $apiName    = classBasename($this) . '/' . __function__;
        $cms_con_id = trim($this->request->post('cms_con_id'));
        $page       = trim($this->request->post('page'));
        $pageNum    = trim($this->request->post('pageNum'));
        $page       = is_numeric($page) ? $page : 1;
        $pageNum    = is_numeric($pageNum) ? $pageNum : 10;
        intval($page);
        intval($pageNum);
        $result = $this->app->product->getProduct($page, $pageNum);
        // $this->apiLog($apiName, [$page, $pageNum], $result['code'], '');
        return $result;
    }

    /**
     * @api              {post} / 添加产品类型
     * @apiDescription   addProduct
     * @apiGroup         admin_Product
     * @apiName          addProduct
     * @apiParam (入参) {String} cms_con_id
     * @apiParam (入参) {String} title 标题
     * @apiParam (入参) {String} image_path 图片路径
     * @apiParam (入参) {Number} [jump_content]  跳转内容
     * @apiParam (入参) {Number} [order]  排序
     * @apiParam (入参) {Number} content  简介
     * @apiSuccess (返回) {String} code 200:成功 / 3001:标题为空 / 3002:图片不存在 / 3003:内容为空 / 3009:添加失败 / 3010:图片没有上传过 
     * @apiSampleRequest /admin/Product/addProduct
     * @return array
     * @author rzc
     */
    public function addProduct() {
        $cms_con_id   = trim($this->request->post('cms_con_id'));
        $title        = trim($this->request->post('title'));
        $image_path   = trim($this->request->post('image_path'));
        $content      = trim($this->request->post('content'));
        $jump_content = trim($this->request->post('jump_content'));
        $order        = trim($this->request->post('order'));
        if (empty($title)) {
            return ['code' => '3001'];
        }
        if (empty($image_path)) {
            return ['code' => '3002'];
        }
        if (empty($content)) {
            return ['code' => '3003'];
        }
        intval($order);
        $result       = $this->app->product->addProduct($title, $image_path, $jump_content, $order, $content);
        // $this->apiLog($apiName, [$page, $pageNum], $result['code'], '');
        return $result;
    }

     /**
     * @api              {post} / 修改产品类型
     * @apiDescription   updateProduct
     * @apiGroup         admin_Product
     * @apiName          updateProduct
     * @apiParam (入参) {String} cms_con_id
     * @apiParam (入参) {String} id
     * @apiParam (入参) {String} [title] 标题
     * @apiParam (入参) {String} [image_path] 图片路径
     * @apiParam (入参) {Number} [jump_content]  跳转内容
     * @apiParam (入参) {Number} [order]  排序
     * @apiParam (入参) {Number} content  简介
     * @apiSuccess (返回) {String} code 200:成功 / 3001:id不存在或者不为数字 / 3002:用户不存在 / 3003:密码错误 / 3004:登录失败
     * @apiSampleRequest /admin/Product/updateProduct
     * @return array
     * @author rzc
     */
    public function updateProduct(){
        $cms_con_id   = trim($this->request->post('cms_con_id'));
        $id           = trim($this->request->post('id'));
        $title        = trim($this->request->post('title'));
        $image_path   = trim($this->request->post('image_path'));
        $content      = trim($this->request->post('content'));
        $jump_content = trim($this->request->post('jump_content'));
        $order        = trim($this->request->post('order'));
        if (empty($id) || intval($id) < 1 || !is_numeric($id)) {
            return ['code' => '3001'];
        }

        intval($order);
        $result       = $this->app->product->updateProduct($id, $title, $image_path,  $jump_content, $order, $content);
        // $this->apiLog($apiName, [$page, $pageNum], $result['code'], '');
        return $result;
    }
}