//
//  HomeTableViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/10/18.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        
        self.goods_pic = [[UIImageView alloc]initWithFrame:CGRectMake(10,10 ,88 ,88 )];
        self.goods_pic.backgroundColor = [UIColor clearColor];
        [self addSubview:self.goods_pic];
        
        

        self.goods_name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.goods_pic.frame)+ 10,10 ,WS_SCREEN_FRAME_WIDTH - CGRectGetMaxX(self.goods_pic.frame) - 20 ,36)];
        self.goods_name.numberOfLines = 2;
        self.goods_name.font = [UIFont systemFontOfSize:12];
        self.goods_name.textColor = WS_RGBA(51,51,51,1);
        [self addSubview:self.goods_name];
        
        
        self.goods_price = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.goods_pic.frame)+ 10,CGRectGetMaxY(self.goods_name.frame)+ 5 , 120,24 )];
        self.goods_price.text = @"";
        self.goods_price.font = [UIFont boldSystemFontOfSize:16];
        self.goods_price.textColor = WS_RGBA(255, 53, 53, 1);
        [self addSubview:self.goods_price];
        
        
        
        self.sale_num = [[UILabel alloc]init];
        self.sale_num.frame=CGRectMake(WS_SCREEN_FRAME_WIDTH-110, CGRectGetMaxY(self.goods_name.frame)+ 5, 100, 18);
        self.sale_num.font = [UIFont systemFontOfSize:11];
        self.sale_num.textAlignment = NSTextAlignmentRight;
        self.sale_num.backgroundColor = [UIColor clearColor];
        self.sale_num.textColor=WS_RGBA(153, 153, 153, 1);
        [self addSubview:self.sale_num];
        
        self.time_out= [[UILabel alloc]init];
        self.time_out.frame=CGRectMake(WS_SCREEN_FRAME_WIDTH-110, CGRectGetMaxY(self.goods_price.frame)+ 5, 100, 18);
        self.time_out.font = [UIFont systemFontOfSize:11];
        self.time_out.textAlignment = NSTextAlignmentRight;
        self.time_out.backgroundColor = [UIColor clearColor];
        self.time_out.textColor=WS_RGBA(153, 153, 153, 1);
        [self addSubview:self.time_out];

        self.line = [[UIView alloc]initWithFrame:CGRectMake(0,107.5,WS_SCREEN_FRAME_WIDTH ,0.5)];
        self.line.backgroundColor = WS_RGBA(238, 238, 238, 1);
        [self addSubview:self.line];
        
    }
    return self;
}


@end
