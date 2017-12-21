//
//  TodayNewProductsCollectionViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "TodayNewProductsCollectionViewCell.h"

@implementation TodayNewProductsCollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=WS_RGBA(255, 255, 255, 1);
        
        self.iconImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, (WS_SCREEN_FRAME_WIDTH/2-(WS_SCREEN_FRAME_WIDTH)*0.25-30)/2, 30,30)];
        self.iconImageView.image=[UIImage imageNamed:@"today_new"];
        [self addSubview:self.iconImageView];
        
        self.titleLabel= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+10,(WS_SCREEN_FRAME_WIDTH/2-(WS_SCREEN_FRAME_WIDTH)*0.25-30)/2,WS_SCREEN_FRAME_WIDTH-80,30)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
        self.titleLabel.textColor =[UIColor blackColor];
        self.titleLabel.textAlignment=NSTextAlignmentLeft;
        self.titleLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.titleLabel];
        
        NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:@"今日新品 TODAY'S NEW PRODUCTS"];
        NSRange sizeRange = NSMakeRange([[titleString string] rangeOfString:@"TODAY'S NEW PRODUCTS"].location, [[titleString string] rangeOfString:@"TODAY'S NEW PRODUCTS"].length);

        [titleString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:sizeRange];
   
        [self.titleLabel setAttributedText:titleString];
        
        

        self.moreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.moreBtn.frame=CGRectMake(WS_SCREEN_FRAME_WIDTH-24-10, (WS_SCREEN_FRAME_WIDTH/2-(WS_SCREEN_FRAME_WIDTH)*0.25-6)/2, 24, 6);
  
        [self.moreBtn setImage:[UIImage imageNamed:@"more_btn"] forState:UIControlStateNormal];
        [self addSubview:self.moreBtn];
        
        
        self.adImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, WS_SCREEN_FRAME_WIDTH/2-(WS_SCREEN_FRAME_WIDTH)*0.25, WS_SCREEN_FRAME_WIDTH-20, WS_SCREEN_FRAME_WIDTH/2)];
        self.adImageView.image=[UIImage imageNamed:@"fabu"];
        [self addSubview:self.adImageView];
        
        float item_width=WS_SCREEN_FRAME_WIDTH-20;
        
//        UIView *line1View=[UIView alloc]initWithFrame:CGRectMake(10, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        
        
        
    }
    return self;
}
@end
