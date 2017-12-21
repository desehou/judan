//
//  PurchaseTableViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/10/19.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "PurchaseTableViewCell.h"

@implementation PurchaseTableViewCell

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
        
        
        self.pic = [[UIImageView alloc]initWithFrame:CGRectMake(10,10 ,80 ,80 )];
        self.pic.backgroundColor = [UIColor clearColor];
        [self addSubview:self.pic];

        self.name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.pic.frame)+ 10,15 ,WS_SCREEN_FRAME_WIDTH - CGRectGetMaxX(self.pic.frame) - 20 ,40)];
        self.name.numberOfLines = 2;
        self.name.font = [UIFont systemFontOfSize:13];
        self.name.textColor = WS_RGBA(51,51,51,1);
        [self addSubview:self.name];
        
        
        self.end_time= [[UILabel alloc]init];
        self.end_time.frame=CGRectMake(CGRectGetMaxX(self.pic.frame)+10, CGRectGetMaxY(self.name.frame)+5, WS_SCREEN_FRAME_WIDTH - CGRectGetMaxX(self.pic.frame) - 20, 35);
        self.end_time.font = [UIFont systemFontOfSize:13];
        self.end_time.textAlignment = NSTextAlignmentLeft;
        self.end_time.backgroundColor = [UIColor clearColor];
        self.end_time.textColor=[UIColor redColor];
        [self addSubview:self.end_time];
        

        
        self.line = [[UIView alloc]initWithFrame:CGRectMake(0,98,WS_SCREEN_FRAME_WIDTH ,2)];
        self.line.backgroundColor = WS_RGBA(238, 238, 238, 1);
        [self addSubview:self.line];
        
    }
    return self;
}


@end
