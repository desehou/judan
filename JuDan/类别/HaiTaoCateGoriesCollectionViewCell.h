//
//  HaiTaoCateGoriesCollectionViewCell.h
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HaiTaoCategoryModel.h"
@interface HaiTaoCateGoriesCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UILabel *category_name;
@property (nonatomic) HaiTaoCategoryModel *haiTaoCategoryModel;
@property (nonatomic) UIEdgeInsets contentInsets;
@end
