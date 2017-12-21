//
//  HLoopScrollView.h
//  testApp
//
//  Created by mmc on 14-4-18.
//
//

#import <UIKit/UIKit.h>

@protocol IHLoopScrollViewDataSource <NSObject>

- (NSInteger) numberOfHLoopScrollViews;
- (UIView*) viewForHLoopScrollViewAtIndex:(NSInteger)index;

@end

@protocol IHLoopScrollViewDelegate <NSObject>

- (void) hLoopScrollViewCellTapped:(NSInteger)index;

@end



@interface HLoopScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic, assign) id<IHLoopScrollViewDataSource> dataSource;
@property (nonatomic, assign) id<IHLoopScrollViewDelegate> delegate;
@property (nonatomic, strong) UIPageControl* pageControlView;
@property (nonatomic, strong) UIScrollView* mainScrollView;
@property (nonatomic, assign) Boolean isNotAotuPage;
//第一次调用
- (void) loadData;
- (void) reloadData;
- (void) freeTimer;

@end
