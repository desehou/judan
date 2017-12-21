//
//  HomeTableViewCell.h
//  JuDan
//
//  Created by junli hou on 2017/10/18.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *goods_pic;                    //商品图片
@property (nonatomic, strong) UILabel     *goods_name;              //商品名称
@property (nonatomic, strong) UILabel     *goods_price;              //商品价格
@property (nonatomic, strong) UILabel     *time_out;              //剩余时间
@property (nonatomic, strong) UILabel     *sale_num;      //商品销量
@property (nonatomic, strong) UIView     *line;              //线

@property (nonatomic, strong) UIView *blackView;                 //阴影区域
@property (nonatomic, strong) UIImageView *soldOutView;    //暂无库存、已下架
@end
