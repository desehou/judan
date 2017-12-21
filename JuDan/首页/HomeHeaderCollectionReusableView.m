//
//  HomeHeaderCollectionReusableView.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "HomeHeaderCollectionReusableView.h"

@implementation HomeHeaderCollectionReusableView
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=WS_RGBA(227, 225, 227, 1);
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        self.titleLabel.textColor =WS_RGBA(167, 165, 168, 1);
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.text=@"--   还没逛够  --";
        self.titleLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.titleLabel];

    }
    return self;
}
@end
