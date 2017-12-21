//
//  SettingTableViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/12/2.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

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
        
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,10 ,30 ,30 )];
        self.iconImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.iconImageView];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+ 10,10 ,WS_SCREEN_FRAME_WIDTH - CGRectGetMaxX(self.iconImageView.frame) - 20 ,30)];

        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor =[UIColor blackColor];
        [self addSubview:self.titleLabel];
        
        
        self.dicTextLabel= [[UILabel alloc]init];
        self.dicTextLabel.frame=CGRectMake(WS_SCREEN_FRAME_WIDTH-190, 10, 150, 30);
        self.dicTextLabel.font = [UIFont systemFontOfSize:13];
        self.dicTextLabel.textAlignment = NSTextAlignmentRight;
        self.dicTextLabel.backgroundColor = [UIColor clearColor];
        self.dicTextLabel.textColor=WS_RGB(51, 51, 51);
        [self addSubview:self.dicTextLabel];
        
        
        
        self.line = [[UIView alloc]initWithFrame:CGRectMake(0,49.5,WS_SCREEN_FRAME_WIDTH ,0.5)];
        self.line.backgroundColor = WS_RGBA(238, 238, 238, 1);
        [self addSubview:self.line];
        
    }
    return self;
}


@end
