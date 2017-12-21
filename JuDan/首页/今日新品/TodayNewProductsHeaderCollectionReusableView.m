//
//  TodayNewProductsHeaderCollectionReusableView.m
//  JuDan
//
//  Created by junli hou on 2017/11/28.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "TodayNewProductsHeaderCollectionReusableView.h"

@implementation TodayNewProductsHeaderCollectionReusableView
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=WS_RGBA(255, 255, 255, 1);
        self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH/2)];
        self.imageView.image=[UIImage imageNamed:@"fabu"];
        [self addSubview:self.imageView];
        
    }
    return self;
}
@end
