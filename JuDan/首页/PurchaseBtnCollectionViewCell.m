//
//  PurchaseBtnCollectionViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "PurchaseBtnCollectionViewCell.h"

@implementation PurchaseBtnCollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=WS_RGBA(255, 255, 255, 1);
        
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, 10)];
        lineView.backgroundColor=WS_RGBA(227, 225, 227, 1);
        [self addSubview:lineView];
        
        self.PurchaseImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 20, WS_SCREEN_FRAME_WIDTH-20, WS_SCREEN_FRAME_WIDTH/2-30)];
        self.PurchaseImageView.image=[UIImage imageNamed:@"fabu"];
        [self addSubview:self.PurchaseImageView];
        
    
        
        
    }
    return self;
}
@end
