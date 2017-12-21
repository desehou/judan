//
//  WSNetwork.m
//  WSMalaysiaSeller
//
//  Created by desehou on 2017/6/21.
//  Copyright © 2017年 wsmall. All rights reserved.
//

#import "WSNetwork.h"

@implementation WSNetwork

+ (void) WSHttpsByType:(NSString *)type Url:(NSString *)url params:(NSDictionary *) params onCompletion:(HttpsDicBlock) completionBlock onError:(AFErrorBlock) errorBlock{
    
    BOOL notReachable = NO;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:

            notReachable = YES;
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            break;
    }
    if (notReachable) {
        NSError *err = [[NSError alloc] initWithDomain:@"网络错误" code:99999 userInfo:nil];
        errorBlock(err);
        return;
    }
    
    
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];


    manager.requestSerializer.timeoutInterval=15;
    

    
    
    if ([type isEqualToString:@"GET"]) {
        [manager GET:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            
            if ([responseObject isEqual:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
                completionBlock(dic);
            }else{
                NSData *data = responseObject;
                
                
                
                NSString *log= [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
              
                NSDictionary *response = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:response];
                completionBlock(dic);
                
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            if (error.code ==-1011) {
                          [WSTool showLoginAd];
            }
       
            
            errorBlock(error);
        }];
    }else if ([type isEqualToString:@"POST"]){
        [manager POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isEqual:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
                completionBlock(dic);
            }else{
                NSData *data = responseObject;
                
                
                NSString *log= [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            
                
                NSDictionary *response = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:response];
                completionBlock(dic);
                
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (error.code ==-1011) {
                [WSTool showLoginAd];
            }
            errorBlock(error);
        }];
    }else if ([type isEqualToString:@"DELETE"]){
        [manager DELETE:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isEqual:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
                completionBlock(dic);
            }else{
                NSData *data = responseObject;
                
                NSDictionary *response = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:response];
                completionBlock(dic);
                
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (error.code ==-1011) {
                [WSTool showLoginAd];
            }
            errorBlock(error);
        }];
    }else if ([type isEqualToString:@"PUT"]){
        [manager PUT:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isEqual:[NSDictionary class]]) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
                completionBlock(dic);
            }else{
                NSData *data = responseObject;
                
                NSDictionary *response = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:response];
                completionBlock(dic);
                
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (error.code ==-1011) {
                [WSTool showLoginAd];
            }
            errorBlock(error);
        }];
    }
    
    
}
+(BOOL)netWorkIsOK
{
   
    BOOL isNetWork;
    Reachability *CurReach = [Reachability reachabilityForInternetConnection];
    switch ([CurReach currentReachabilityStatus]) {
        case NotReachable://没有网络
        {

            
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

@end
