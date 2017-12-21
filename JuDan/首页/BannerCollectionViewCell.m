//
//  BannerCollectionViewCell.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "BannerCollectionViewCell.h"

@implementation BannerCollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        self.backgroundColor=[UIColor whiteColor];
        self.bannerScrollView = [[HLoopScrollView alloc] initWithFrame:CGRectMake(0,0, WS_SCREEN_FRAME_WIDTH, 175*WS_SCREEN_FRAME_WIDTH/375)];
        self.bannerScrollView.delegate = self;
        self.bannerScrollView.dataSource = self;
        self.bannerScrollView.backgroundColor= WS_RGBA(242,242,242,1);
        [self.contentView addSubview:self.bannerScrollView];
    }
    return self;
}

#pragma mark-
#pragma mark @protocol IHLoopScrollViewDataSource <NSObject>
- (NSInteger) numberOfHLoopScrollViews
{
    return 3;
}

- (UIView*) viewForHLoopScrollViewAtIndex:(NSInteger)index
{
    ADBannerView* bannerViewCell = [[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH,WS_SCREEN_FRAME_WIDTH * 175 / 375)];
    if (4 > 0) {
        
        //        [bannerViewCell.imgView sd_setImageWithURL:[NSURL URLWithString:groupMallAdObject.img_url]
        //                                  placeholderImage:[UIImage imageNamed:@"default_bg"]];
        bannerViewCell.imgView.image=[UIImage imageNamed:@"banner"];
    }
    return bannerViewCell;
}

#pragma mark @protocol IHLoopScrollViewDelegate <NSObject>
- (void) hLoopScrollViewCellTapped:(NSInteger)index
{

    /*
     GroupTastPicsObject *groupTastPicsObject=[self.adArraySource objectAtIndex:index];
     */
}

@end
