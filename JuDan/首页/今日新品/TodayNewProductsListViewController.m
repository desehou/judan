//
//  TodayNewProductsListViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "TodayNewProductsListViewController.h"
#import "ProductsItemCollectionViewCell.h"
#import "TodayNewProductsHeaderCollectionReusableView.h"

@interface TodayNewProductsListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
    int list_page;
}
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation TodayNewProductsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    self.title=self.titleString;
    [self listRequest];
    
    [self initContentView];
    
    [self addHeader];
    [self addFooter];
}


- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView{
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_HEIGHT) collectionViewLayout:layout];
    self.collectionView.backgroundColor=WS_RGBA(227, 225, 227, 1);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = YES;
    

    [self.collectionView registerClass:[TodayNewProductsHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TodayNewProductsHeaderCollectionReusableView"];

    
    [self.collectionView registerClass:[ProductsItemCollectionViewCell class] forCellWithReuseIdentifier:@"ProductsItemCollectionViewCell"];
    

    
    [self.view addSubview:self.collectionView];
    
}



-(void)addHeader{
    
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        list_page = 1;
        [self listRequest];
    }];
}
-(void)addFooter{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(listRequest)];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    self.collectionView.mj_footer = footer;
}

- (void)listRequest
{
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return 10;

}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *identifier = @"ProductsItemCollectionViewCell";
        ProductsItemCollectionViewCell *productsItemCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return productsItemCollectionViewCell;

}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

        if([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            TodayNewProductsHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"TodayNewProductsHeaderCollectionReusableView" forIndexPath:indexPath];
            if(headerView == nil)
            {
                headerView = [[TodayNewProductsHeaderCollectionReusableView alloc] init];
            }
            
            //            headerView.titleLabel.text=@"--还没逛够--";
            return headerView;
        }

    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{

        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH/2);

}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        return CGSizeMake((WS_SCREEN_FRAME_WIDTH)/2, (WS_SCREEN_FRAME_WIDTH)/2+50);

}
-(CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0.0;
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    
    return UIEdgeInsetsMake(0,0,0,0);
    
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
