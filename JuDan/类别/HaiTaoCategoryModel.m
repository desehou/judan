//
//  HaiTaoCategoryModel.m
//  thalassa
//
//  Created by desehou on 2016/12/19.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import "HaiTaoCategoryModel.h"

@implementation HaiTaoCategoryModel
- (instancetype)initWithName:(NSString *)name font:(UIFont *)font {
    if (self = [super init]) {
        _name = name;
        self.font = font;
    }
    return self;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    
    [self calculateContentSize];
}

- (void)calculateContentSize {
    NSDictionary *dict = @{NSFontAttributeName: self.font};
    CGSize textSize = [_name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000)
                                          options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    _contentSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

@end
