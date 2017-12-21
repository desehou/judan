//
//  HaiTaoCategoryModel.h
//  thalassa
//
//  Created by desehou on 2016/12/19.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@interface HaiTaoCategoryModel : NSObject
@property (copy, nonnull) NSString *name;
@property (nonatomic) BOOL selected;
//用于计算文字大小
@property (strong, nonatomic) UIFont *font;

@property (nonatomic, readonly) CGSize contentSize;

- (instancetype)initWithName:(NSString *)name font:(UIFont *)font;
@end
