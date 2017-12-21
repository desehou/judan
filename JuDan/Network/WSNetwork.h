//
//  WSNetwork.h
//  WSMalaysiaSeller
//
//  Created by desehou on 2017/6/21.
//  Copyright © 2017年 wsmall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CurrencyResponseBlock)(double rate);
typedef void (^HttpsDicBlock)(NSMutableDictionary *dic);
typedef void (^AFErrorBlock)(NSError* error);
@interface WSNetwork : NSObject
+ (void) WSHttpsByType:(NSString *)type Url:(NSString *)url params:(NSDictionary *) params onCompletion:(HttpsDicBlock) completionBlock onError:(AFErrorBlock) errorBlock;

+(BOOL)netWorkIsOK;
@end
