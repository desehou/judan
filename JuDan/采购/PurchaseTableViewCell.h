//
//  PurchaseTableViewCell.h
//  JuDan
//
//  Created by junli hou on 2017/10/19.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *pic;                    //图片
@property (nonatomic, strong) UILabel     *name;              //名称
@property (nonatomic, strong) UILabel     *end_time;      //剩余时间
@property (nonatomic, strong) UIView     *line;              //线


@end
