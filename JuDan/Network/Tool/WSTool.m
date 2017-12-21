//
//  WSTool.m
//  WSMalaysiaSeller
//
//  Created by desehou on 2017/6/21.
//  Copyright © 2017年 wsmall. All rights reserved.
//

#import "WSTool.h"

@implementation WSTool
+ (UIImage*) imageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}
+ (NSString*)getPreferredLanguage

{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    
    NSLog(@"当前语言:%@", preferredLang);
    
    return preferredLang;
    
}
//获取当前年月
+ (NSString*)getSystemYearMonth
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy-MM"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    return locationString;
    
}
//获取当前年
+ (NSString*)getSystemYear
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    return locationString;
    
}
//获取当前月
+ (NSString*)getSystemMonth
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"MM"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    return locationString;
}
//获取当前时间的时间戳
+(NSString*)getCurrentTimestamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
}
+ (UIImage *) dataURL2Image: (NSString *) imgSrc
{
    NSURL *url = [NSURL URLWithString: imgSrc];
    NSData *data = [NSData dataWithContentsOfURL: url];
    UIImage *image = [UIImage imageWithData: data];
    
    return image;
}


+ (ImageType)imageTypeFromData:(NSString *)url
{
    NSData *imageData =[NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    if (imageData.length > 4) {
        const unsigned char * bytes = [imageData bytes];
        
        if (bytes[0] == 0xff &&
            bytes[1] == 0xd8 &&
            bytes[2] == 0xff)
        {
            return NSPUIImageType_JPEG;
        }
        
        if (bytes[0] == 0x89 &&
            bytes[1] == 0x50 &&
            bytes[2] == 0x4e &&
            bytes[3] == 0x47)
        {
            return NSPUIImageType_PNG;
        }
    }
    
    return NSPUIImageType_Unknown;
}

+(BOOL)netWorkIsOK
{
    
    BOOL isNetWork;
    Reachability *CurReach = [Reachability reachabilityForInternetConnection];
    switch ([CurReach currentReachabilityStatus]) {
        case NotReachable://没有网络
        {
            [SVProgressHUD showErrorWithStatus:@"网络异常，请检查网络设置！"];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            [SVProgressHUD dismissWithDelay:1.5];
            
            isNetWork=false;
            break;
        }
            
        case ReachableViaWiFi://有wifi
            
        {
            isNetWork=YES;
            break;
            
        }
            
        case ReachableViaWWAN://有3G/4G
            
        {
            isNetWork=YES;
            break;
            
        }
            
        default:
            
            break;
    }
    return isNetWork;
}


+ (NSString *)timeWithTimeInterval:(float)timeValue
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeValue]];
    
    return currentDateStr;
}
@end
