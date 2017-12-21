//
//  APIMacro.h
//  CocoaPodsDemo
//
//  Created by desehou on 2017/5/23.
//  Copyright © 2017年 wsmall. All rights reserved.
//

/**
 *  本文件可放请求API 拼接的路径
 */

#define DEV_MODEL 1           //当前环境


#if DEV_MODEL ==0                   //开发环境
#define WS_URL        @"http://ares-dev.wsmall.com.my/api"
#elif DEV_MODEL ==1                 //测试环境
#define WS_URL        @"http://1688390um3.imwork.net/"
#elif DEV_MODEL ==2                 //预演环境
#define WS_URL        @"http://ares-pre.wsmall.com.my/api"
#elif DEV_MODEL ==3                //正式环境
#define WS_URL        @"http://ares.wsmall.com.my/api"
#endif
