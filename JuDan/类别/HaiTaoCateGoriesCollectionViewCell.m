//
//  HaiTaoCateGoriesCollectionViewCell.m
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import "HaiTaoCateGoriesCollectionViewCell.h"

@implementation HaiTaoCateGoriesCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        _category_name = [[UILabel alloc] init];
        _category_name.textAlignment = NSTextAlignmentCenter;
        _category_name.userInteractionEnabled = NO;
        _category_name.font=[UIFont systemFontOfSize:13];
        _category_name.textColor=WS_RGBA(102, 102, 102, 1);
        [self.contentView addSubview:_category_name];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    CGFloat width = bounds.size.width - self.contentInsets.left - self.contentInsets.right;
    CGRect frame = CGRectMake(0, 0, width, 20);
    self.category_name.frame = frame;
    self.category_name.center = self.contentView.center;
}


@end
