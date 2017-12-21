//
//  WSTool.h
//  WSMalaysiaSeller
//
//  Created by desehou on 2017/6/21.
//  Copyright © 2017年 wsmall. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{   NSPUIImageType_JPEG,
    NSPUIImageType_PNG,
    NSPUIImageType_Unknown
}ImageType;
@interface WSTool : NSObject
+ (UIImage*) imageWithColor:(UIColor*)color andHeight:(CGFloat)height;
+ (float) heightForString:(UITextView *)textView andWidth:(float)width;
+ (NSString*)getPreferredLanguage;
+ (NSString*)getSystemYearMonth;
+ (NSString*)getSystemYear;
+ (NSString*)getSystemMonth;
+(NSString*)getCurrentTimestamp;
+ (UIImage *) dataURL2Image: (NSString *) imgSrc;
+(void)goHome;
+ (void)customizeTabBarForController:(UITabBarController *)tabBarController ;
+(void)showUpdateVersion:(NSDictionary*)data viewController:(id)viewController;
+ (void)showLoginAd;
+ (ImageType)imageTypeFromData:(NSString *)url;
+(BOOL)netWorkIsOK;
+(NSString*)getfriendId:(NSString *)str;
+ (NSString *)timeWithTimeInterval:(float)timeValue;
@end
