//
//  HaiTaoCateGoriesTableViewCell.m
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import "HaiTaoCateGoriesTableViewCell.h"

@implementation HaiTaoCateGoriesTableViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        _category = [[UILabel alloc] init];
         _category.frame = CGRectMake(17.5, 12.5, frame.size.width-35, 25);
        _category.textAlignment = NSTextAlignmentCenter;
        _category.userInteractionEnabled = NO;
        _category.font=[UIFont systemFontOfSize:14];
        _category.textColor=WS_RGBA(51, 51, 51, 1);
        _category.layer.cornerRadius = 25/2;
        _category.layer.masksToBounds = YES;
        [self.contentView addSubview:_category];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
