//
//  UINavigationController+KeleMallNav.m
//  KaleMallDemo1
//
//  Created by 王璞 on 15/6/26.
//  Copyright (c) 2015年 wangpu. All rights reserved.
//

#import "UINavigationController+KeleMallNav.h"


@implementation UINavigationController (KeleMallNav)






- (void)addBackBtnWithTarget:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,0,20,20);
    [btn setBackgroundImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.visibleViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}
//导航右侧带图片按钮
- (void)addCustemRightBtnWithImage:(UIImage *)image target:(id)target action:(SEL)action;
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0,0,18,18);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

//右侧自定义按钮带颜色文字
- (void)addCustemRightBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action color:(UIColor*)color
{
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 80, 30);
    [saveBtn setTitle:title forState:UIControlStateNormal];
    [saveBtn setTitleColor:color forState:UIControlStateNormal];
    saveBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:16.];
    [saveBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
}



@end
