//
//  HaiTaoCateGoriesHeadCollectionReusableView.m
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import "HaiTaoCateGoriesHeadCollectionReusableView.h"

@implementation HaiTaoCateGoriesHeadCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        self.category_title = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, frame.size.width, 20)];
        self.category_title.textAlignment=NSTextAlignmentLeft;
        self.category_title.font=[UIFont boldSystemFontOfSize:16.0];
        self.category_title.textColor=WS_RGBA(51, 51, 51, 1);
        [self addSubview:self.category_title];
    }
    return self;
}
@end
