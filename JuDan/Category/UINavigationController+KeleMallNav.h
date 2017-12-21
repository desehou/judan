//
//  UINavigationController+KeleMallNav.h
//  KaleMallDemo1
//
//  Created by 王璞 on 15/6/26.
//  Copyright (c) 2015年 wangpu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (KeleMallNav)

- (void)addBackBtnWithTarget:(id)target action:(SEL)action;
//右侧图片btn
- (void)addCustemRightBtnWithImage:(UIImage *)image target:(id)target action:(SEL)action;
//右侧自定义按钮带颜色文字
- (void)addCustemRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action color:(UIColor*)color;
@end
