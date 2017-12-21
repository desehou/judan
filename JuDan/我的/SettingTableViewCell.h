//
//  SettingTableViewCell.h
//  JuDan
//
//  Created by junli hou on 2017/12/2.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *iconImageView;                    //图片
@property (nonatomic, strong) UILabel     *titleLabel;              //名称
@property (nonatomic, strong) UILabel     *dicTextLabel;      //描述

@property (nonatomic, strong) UIView     *line;              //线
@end
