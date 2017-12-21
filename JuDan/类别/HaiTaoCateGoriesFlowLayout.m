//
//  HaiTaoCateGoriesFlowLayout.m
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import "HaiTaoCateGoriesFlowLayout.h"
#import "SectionYobject.h"

@interface HaiTaoCateGoriesFlowLayout()
@end

@implementation HaiTaoCateGoriesFlowLayout
#pragma mark - 初始化属性
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupLayout];

    }
    return self;
}

- (void)setupLayout
{
    self.minimumInteritemSpacing = 5;//同一行不同cell间距
    self.minimumLineSpacing = 5;//行间距
    self.headerReferenceSize = CGSizeMake(0, 30);//设置section header 固定高度，如果需要的话
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
}

#pragma mark - 重写父类的方法，实现瀑布流布局
#pragma mark - 当尺寸有所变化时，重新刷新
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (void)prepareLayout {
    [super prepareLayout];
}

@end
