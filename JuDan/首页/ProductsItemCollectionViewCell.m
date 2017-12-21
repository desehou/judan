//
//  ProductsItemCollectionViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "ProductsItemCollectionViewCell.h"

@implementation ProductsItemCollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        

        self.backgroundColor=WS_RGB(227, 225, 227);
        
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, WS_SCREEN_FRAME_WIDTH/2-20,WS_SCREEN_FRAME_WIDTH/2-20)];
        self.imageView.image=[UIImage imageNamed:@"banner"];
        
        
        [self addSubview:self.imageView];
        


        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.imageView.frame),WS_SCREEN_FRAME_WIDTH/2-20,30)];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        self.nameLabel.textColor =[UIColor blackColor];
        self.nameLabel.textAlignment=NSTextAlignmentCenter;
        self.nameLabel.text=@"2017年新款产品男士长裤新款产品男士长新款产品男士长新款产品男士长";
        self.nameLabel.backgroundColor=[UIColor whiteColor];
        self.nameLabel.numberOfLines=2;
                [self addSubview:self.nameLabel];
        self.goodsPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(self.nameLabel.frame),WS_SCREEN_FRAME_WIDTH/2-20,30)];
        self.goodsPriceLabel.font = [UIFont systemFontOfSize:12.0];
        self.goodsPriceLabel.textColor =WS_RGBA(255, 52, 52, 1);
        self.goodsPriceLabel.textAlignment=NSTextAlignmentLeft;
        self.goodsPriceLabel.text=@"￥78.00";
        self.goodsPriceLabel.backgroundColor=[UIColor whiteColor];
        self.goodsPriceLabel.numberOfLines=1;
        [self addSubview:self.goodsPriceLabel];
        

        
        
    }
    return self;
}

@end
