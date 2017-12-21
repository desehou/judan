//
//  BannerCollectionViewCell.h
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLoopScrollView.h"
#import "ADBannerView.h"
@interface BannerCollectionViewCell : UICollectionViewCell<IHLoopScrollViewDelegate,IHLoopScrollViewDataSource>
@property (nonatomic, strong) HLoopScrollView *bannerScrollView;
@property (nonatomic, strong) NSMutableArray *pics;
@end
