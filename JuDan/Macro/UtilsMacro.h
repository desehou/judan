//
//  UtilsMacro.h
//  CocoaPodsDemo
//
//  Created by desehou on 2017/5/23.
//  Copyright © 2017年 wsmall. All rights reserved.
//
/**
 *  本类放一些常用工具的宏定义
 *   PS:格式为 WS_驼峰／大写
 */


/** 设置颜色RGB **/
#define WS_RGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define WS_RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define WS_RGBV(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/** 设置随机颜色 **/
#define WS_RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

/** 沙盒路径  **/
#define WS_PATH_OF_APP_HOME    NSHomeDirectory()
#define WS_PATH_OF_TEMP        NSTemporaryDirectory()
#define WS_PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/** DEBUG LOG  **/
#ifdef DEBUG
#define WSLOG(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#endif

/** 手机屏幕 宽和高  **/
#define WS_SCREEN_FRAME           [[UIScreen mainScreen] bounds]
#define WS_SCREEN_FRAME_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define WS_SCREEN_FRAME_WIDTH     [[UIScreen mainScreen] bounds].size.width


/** View 坐标(x,y)和宽高(width,height)  **/
#define WS_X(v)                    (v).frame.origin.x
#define WS_Y(v)                    (v).frame.origin.y
#define WS_WIDTH(v)                (v).frame.size.width
#define WS_HEIGHT(v)               (v).frame.size.height

#define WS_MinX(v)                 CGRectGetMinX((v).frame)
#define WS_MinY(v)                 CGRectGetMinY((v).frame)

#define WS_MidX(v)                 CGRectGetMidX((v).frame)
#define WS_MidY(v)                 CGRectGetMidY((v).frame)

#define WS_MaxX(v)                 CGRectGetMaxX((v).frame)
#define WS_MaxY(v)                 CGRectGetMaxY((v).frame)


#define WS_NavigationBar_HEIGHT   44

/** 系统版本号  **/
#define WS_SYSTEM_VERSION  [[UIDevice currentDevice] systemVersion]

/** 系统语言  **/
#define WS_SYSTEM_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

/** 字符串不为NULL  **/
#define WS_STR_NOT_NULL(x) ((x) == nil || [(x) isKindOfClass:[NSNull class]] ? @"" : (x))

/** 获取通知中心  **/
#define WS_NotificationCenter [NSNotificationCenter defaultCenter]

/** 获取UserDefaults  **/
#define WS_UserDefaults     [NSUserDefaults standardUserDefaults]

/** 获取AppDelegate  **/
#define WS_AppDelegate      [UIApplication sharedApplication].delegate

/** 设置View圆角  **/
#define WS_ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/** 获取图片资源  **/
#define WS_ImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define WS_ImageFile(imageName,type)  [UIImage imageWithContentsOfFile:［NSBundle mainBundle]pathForResource:file ofType:type］

/** 弱引用/强引用  **/
#define WS_WeakSelf(type)  __weak typeof(type) weak##type = type;
#define WS_StrongSelf(type)  __strong typeof(type) type = weak##type;

/** GCD  **/
//GCD - 一次性执行
#define WS_DISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define WS_DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define WS_DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#define WSInternationString(key)             NSLocalizedStringFromTable(key, @"Localizable", nil)

#define WSToast(key) [self.view makeToast:key duration:1.0 position:CSToastPositionCenter];

/** 获取String内容 **/
#define WS_GetStringFromLocalizableWithKey(key)   [[WSLanguageTool sharedInstance] getStringForKey:key withTable:@"Localizable"]

//订单状态icon
#define orderStateIcon  @{@"1":@"\U0000e6a5", @"2":@"\U0000e6a7",@"3":@"\U0000e6a0",@"4":@"\U0000e6a4",@"5":@"\U0000e6a1",@"11":@"\U0000e69e",@"21":@"\U0000e6a6",@"22":@"\U0000e69f",@"31":@"\U0000e6a3",@"32":@"\U0000e69a2"}


