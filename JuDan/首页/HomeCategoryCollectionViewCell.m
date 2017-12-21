//
//  HomeCategoryCollectionViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/11/26.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "HomeCategoryCollectionViewCell.h"

@implementation HomeCategoryCollectionViewCell

- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=WS_RGBA(255, 255, 255, 1);
        self.imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, (WS_SCREEN_FRAME_WIDTH-10*10)/5,(WS_SCREEN_FRAME_WIDTH-10*10)/5)];
        self.imageView1.image=[UIImage imageNamed:@"today_icon"];
        [self addSubview:self.imageView1];
        
        
        UILabel *titleLabel1= [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.imageView1.frame)+4,WS_SCREEN_FRAME_WIDTH/5,20)];
        titleLabel1.font = [UIFont systemFontOfSize:13.0];
        titleLabel1.textColor =[UIColor blackColor];
        titleLabel1.textAlignment=NSTextAlignmentCenter;
        titleLabel1.text=@"今日新品";
        titleLabel1.backgroundColor=[UIColor clearColor];
        [self addSubview:titleLabel1];
        
        self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button1.frame=CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH/5,WS_SCREEN_FRAME_WIDTH/4);
        self.button1.tag=101;
        [self addSubview:self.button1];
        

        self.imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button1.frame)+10, 10, (WS_SCREEN_FRAME_WIDTH-10*10)/5,(WS_SCREEN_FRAME_WIDTH-10*10)/5)];
        self.imageView2.image=[UIImage imageNamed:@"goodscategory_icon"];
        [self addSubview:self.imageView2];
        
        UILabel *titleLabel2= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button1.frame),CGRectGetMaxY(self.imageView2.frame)+4,WS_SCREEN_FRAME_WIDTH/5,20)];
        titleLabel2.font = [UIFont systemFontOfSize:13.0];
        titleLabel2.textColor =[UIColor blackColor];
        titleLabel2.textAlignment=NSTextAlignmentCenter;
        titleLabel2.text=@"热销分类";
        titleLabel2.backgroundColor=[UIColor clearColor];
        [self addSubview:titleLabel2];
        
        self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button2.frame=CGRectMake(CGRectGetMaxX(self.button1.frame), 0, WS_SCREEN_FRAME_WIDTH/5,WS_SCREEN_FRAME_WIDTH/4);
        self.button2.tag=102;
        [self addSubview:self.button2];
        
        
        self.imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button2.frame)+10, 10, (WS_SCREEN_FRAME_WIDTH-10*10)/5,(WS_SCREEN_FRAME_WIDTH-10*10)/5)];
        self.imageView3.image=[UIImage imageNamed:@"texuan_icon"];
        [self addSubview:self.imageView3];
        
        UILabel *titleLabel3= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button2.frame),CGRectGetMaxY(self.imageView3.frame)+4,WS_SCREEN_FRAME_WIDTH/5,20)];
        titleLabel3.font = [UIFont systemFontOfSize:13.0];
        titleLabel3.textColor =[UIColor blackColor];
        titleLabel3.textAlignment=NSTextAlignmentCenter;
        titleLabel3.text=@"精选产品";
        titleLabel3.backgroundColor=[UIColor clearColor];
        [self addSubview:titleLabel3];
        
        self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button3.frame=CGRectMake(CGRectGetMaxX(self.button2.frame), 0, WS_SCREEN_FRAME_WIDTH/5,WS_SCREEN_FRAME_WIDTH/4);
        self.button3.tag=103;
        [self addSubview:self.button3];
        
        
        self.imageView4=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button3.frame)+10, 10, (WS_SCREEN_FRAME_WIDTH-10*10)/5,(WS_SCREEN_FRAME_WIDTH-10*10)/5)];
        self.imageView4.image=[UIImage imageNamed:@"qincang_icon"];
        [self addSubview:self.imageView4];
        
        
        UILabel *titleLabel4= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button3.frame),CGRectGetMaxY(self.imageView4.frame)+4,WS_SCREEN_FRAME_WIDTH/5,20)];
        titleLabel4.font = [UIFont systemFontOfSize:13.0];
        titleLabel4.textColor =[UIColor blackColor];
        titleLabel4.textAlignment=NSTextAlignmentCenter;
        titleLabel4.text=@"清仓特卖";
        titleLabel4.backgroundColor=[UIColor clearColor];
        [self addSubview:titleLabel4];
        
        self.button4=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button4.frame=CGRectMake(CGRectGetMaxX(self.button3.frame), 0, WS_SCREEN_FRAME_WIDTH/5,WS_SCREEN_FRAME_WIDTH/4);
        self.button4.tag=104;
        [self addSubview:self.button4];
        
        
        self.imageView5=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button4.frame)+10, 10, (WS_SCREEN_FRAME_WIDTH-10*10)/5,(WS_SCREEN_FRAME_WIDTH-10*10)/5)];
        self.imageView5.image=[UIImage imageNamed:@"bimai_icon"];
        [self addSubview:self.imageView5];
        
        
        UILabel *titleLabel5= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.button4.frame),CGRectGetMaxY(self.imageView5.frame)+4,WS_SCREEN_FRAME_WIDTH/5,20)];
        titleLabel5.font = [UIFont systemFontOfSize:13.0];
        titleLabel5.textColor =[UIColor blackColor];
        titleLabel5.textAlignment=NSTextAlignmentCenter;
        titleLabel5.text=@"必买清单";
        titleLabel5.backgroundColor=[UIColor clearColor];
        [self addSubview:titleLabel5];
        
        self.button5=[UIButton buttonWithType:UIButtonTypeCustom];
        self.button5.frame=CGRectMake(CGRectGetMaxX(self.button4.frame), 0, WS_SCREEN_FRAME_WIDTH/5,WS_SCREEN_FRAME_WIDTH/4);
        self.button5.tag=105;
        [self addSubview:self.button5];
        
   
        
        
    }
    return self;
}
@end
