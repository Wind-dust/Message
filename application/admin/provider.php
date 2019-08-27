<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用容器绑定定义
return [
    'banner'          => app\common\action\admin\Banner::class,
    'admin'           => app\common\action\admin\Admin::class,
    'adminLog'        => app\common\action\admin\AdminLog::class,
    'solution'        => app\common\action\admin\Solution::class,
    'product'         => app\common\action\admin\Product::class,
    'applicationcase' => app\common\action\admin\ApplicationCase::class,
    'downloadcenter'  => app\common\action\admin\DownloadCenter::class,
];
