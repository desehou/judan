//
//  HaiTaoCateGoriesFlowLayout.h
//  thalassa
//
//  Created by desehou on 2016/12/15.
//  Copyright © 2016年 Gray_Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HaiTaoCateGoriesFlowLayout;
@protocol  HaiTaoCateGoriesFlowLayoutDelegate <NSObject>
/**通过代理获得每个cell的宽度*/
- (CGFloat)waterFlowLayout:(HaiTaoCateGoriesFlowLayout *)layout
          widthAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface HaiTaoCateGoriesFlowLayout : UICollectionViewFlowLayout
@property (nonatomic,assign) id<HaiTaoCateGoriesFlowLayoutDelegate> delegate;
@property(nonatomic,assign)CGFloat rowHeight;///< 固定行高
@end
