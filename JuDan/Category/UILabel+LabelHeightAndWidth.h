//
//  UILabel+LabelHeightAndWidth.h
//  KalemallApp
//
//  Created by desehou on 2016/11/8.
//  Copyright © 2016年 wsmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelHeightAndWidth)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
