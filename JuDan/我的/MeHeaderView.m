//
//  MeHeaderView.m
//  JuDan
//
//  Created by junli hou on 2017/12/4.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "MeHeaderView.h"

@implementation MeHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        
        if (![self.user_type isEqualToString:@"1"]) {
            self.backgroundColor=WS_RGBA(238, 140, 74, 1);
        }else{
            
            self.backgroundColor=WS_RGBA(24, 96, 246, 1);
        }
        
        
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake((WS_SCREEN_FRAME_WIDTH-50)/2,(WS_SCREEN_FRAME_WIDTH/3-50)/2 ,50 ,50 )];
        self.picImageView.backgroundColor = [UIColor clearColor];
        self.picImageView.layer.cornerRadius=25;
        self.picImageView.layer.masksToBounds=YES;
        self.picImageView.image=[UIImage imageNamed:@"user_edit_pic"];
        [self addSubview:self.picImageView];
        
        
        
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picImageView.frame),WS_SCREEN_FRAME_WIDTH , 20)];
        self.userNameLabel.textAlignment=NSTextAlignmentCenter;
        self.userNameLabel.font=[UIFont systemFontOfSize:15.0];
        self.userNameLabel.textColor=[UIColor whiteColor];
        self.userNameLabel.text=@"注册/登录";
        [self addSubview:self.userNameLabel];
    }
    return self;
}
@end
