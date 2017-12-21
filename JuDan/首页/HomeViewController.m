//
//  HomeViewController.m
//  JuDan
//
//  Created by desehou on 2017/10/17.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HLoopScrollView.h"
#import "ADBannerView.h"
#import "BannerCollectionViewCell.h"
#import "HomeCategoryCollectionViewCell.h"
#import "PurchaseBtnCollectionViewCell.h"
#import "TodayNewProductsCollectionViewCell.h"
#import "FeaturedProductsCollectionViewCell.h"
#import "SellingCategoryCollectionViewCell.h"
#import "MustBuyCollectionViewCell.h"
#import "ProductsItemCollectionViewCell.h"
#import "HomeHeaderCollectionReusableView.h"
#import "TodayNewProductsListViewController.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
      int list_page;
}
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"聚单商城";
    
    [self homeRequest];
    
    [self initContentView];
    
    [self addHeader];
    [self addFooter];
    
}

-(void)homeRequest
{
    NSString *testUserReq=@" [  {\"name\":\"123\",\"pwd\":\"123456\"},{\"name\":\"124\",\"pwd\":\"123789\"},{\"name\":\"125\",\"pwd\":\"456789\"}]";
    
    NSMutableArray *users=[[NSMutableArray alloc]initWithCapacity:0];
    
    NSMutableDictionary *user1 = [[NSMutableDictionary alloc] init];
    [user1 setObject:@"123221232" forKey:@"name"];
    [user1 setObject:@"88888" forKey:@"pwd"];
    
    [users addObject:user1];
    
    NSMutableDictionary *user2 = [[NSMutableDictionary alloc] init];
    [user2 setObject:@"4444" forKey:@"name"];
    [user2 setObject:@"322" forKey:@"pwd"];
    
    
    [users addObject:user2];
    
    NSMutableDictionary *user3 = [[NSMutableDictionary alloc] init];
    [user3 setObject:@"666666" forKey:@"name"];
    [user3 setObject:@"1111" forKey:@"pwd"];
    
    [users addObject:user3];
    
    NSMutableDictionary *user4 = [[NSMutableDictionary alloc] init];
    [user4 setObject:@"8877" forKey:@"name"];
    [user4 setObject:@"2222" forKey:@"pwd"];
    [users addObject:user4];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:users
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    

    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"12322" forKey:@"id"];
    [params setObject:string forKey:@"testUserReq"];
    [WSNetwork WSHttpsByType:@"POST" Url:[NSString stringWithFormat:@"%@%@",WS_URL,@"slt_jdw_apptrans/userArray.action"] params:params onCompletion:^(NSMutableDictionary *dic){
        
    
    }onError:^(NSError *error){
        if (error.code==99999) {
        
        }
        [SVProgressHUD dismiss];
    }];

    
    
    
    
}
- (void)initContentView{
    
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_HEIGHT-49) collectionViewLayout:layout];
    self.collectionView.backgroundColor=WS_RGBA(227, 225, 227, 1);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = YES;
    
    [self.collectionView registerClass:[BannerCollectionViewCell class] forCellWithReuseIdentifier:@"BannerCollectionViewCell"];
    [self.collectionView registerClass:[HomeCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCategoryCollectionViewCell"];
    [self.collectionView registerClass:[PurchaseBtnCollectionViewCell class] forCellWithReuseIdentifier:@"PurchaseBtnCollectionViewCell"];
    [self.collectionView registerClass:[TodayNewProductsCollectionViewCell class] forCellWithReuseIdentifier:@"TodayNewProductsCollectionViewCell"];
    
        [self.collectionView registerClass:[TodayNewProductsCollectionViewCell class] forCellWithReuseIdentifier:@"HotProductsCollectionViewCell"];
    
    [self.collectionView registerClass:[FeaturedProductsCollectionViewCell class] forCellWithReuseIdentifier:@"FeaturedProductsCollectionViewCell"];
    [self.collectionView registerClass:[SellingCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"SellingCategoryCollectionViewCell"];
    
    [self.collectionView registerClass:[SellingCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"SellingCategoryCollectionViewCell6"];
    
    [self.collectionView registerClass:[ProductsItemCollectionViewCell class] forCellWithReuseIdentifier:@"ProductsItemCollectionViewCell"];
    
    [self.collectionView registerClass:[HomeHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeHeaderCollectionReusableView"];

    [self.view addSubview:self.collectionView];

}



-(void)addHeader{
    
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        list_page = 1;
        [self homeRequsest];
    }];
}
-(void)addFooter{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(homeRequsest)];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    self.collectionView.mj_footer = footer;
}

- (void)homeRequsest
{
        [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 9;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if (section==0) {
        return 1;
    }else if(section==1){
        return 1;
    }else if(section==2){
         return 1;
    }else if(section==3){
         return 1;
    }else if(section==4){
        return 1;
    }else if(section==5){
        return 1;
    }else if(section==6){
        return 1;
    }else if(section==7){
        return 1;
    }else if(section==8){
        return 10;
    }else{
        return 1;
    }
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0) {
        static NSString *identifier = @"BannerCollectionViewCell";
        BannerCollectionViewCell *panicCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//        panicCell.pics=self.groupMallObject.pics;
            [panicCell.bannerScrollView  freeTimer];
            [panicCell.bannerScrollView reloadData];
        return panicCell;
    }else if(indexPath.section==1){
        static NSString *identifier = @"HomeCategoryCollectionViewCell";
        HomeCategoryCollectionViewCell *homeCategoryCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return homeCategoryCollectionViewCell;
    }else if(indexPath.section==2){
        static NSString *identifier = @"PurchaseBtnCollectionViewCell";
        PurchaseBtnCollectionViewCell *purchaseBtnCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return purchaseBtnCollectionViewCell;
    }else if(indexPath.section==3){
        static NSString *identifier = @"TodayNewProductsCollectionViewCell";
        TodayNewProductsCollectionViewCell *todayNewProductsCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        [todayNewProductsCollectionViewCell.moreBtn addTarget:self action:@selector(goTodayNewProductsVC) forControlEvents:UIControlEventTouchUpInside];
        return todayNewProductsCollectionViewCell;
    }else if(indexPath.section==4){
        static NSString *identifier = @"HotProductsCollectionViewCell";
        TodayNewProductsCollectionViewCell *todayNewProductsCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return todayNewProductsCollectionViewCell;
    }else if(indexPath.section==5){
        static NSString *identifier = @"FeaturedProductsCollectionViewCell";
        FeaturedProductsCollectionViewCell *featuredProductsCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return featuredProductsCollectionViewCell;
    }else if(indexPath.section==6){
        static NSString *identifier = @"SellingCategoryCollectionViewCell6";
        SellingCategoryCollectionViewCell *sellingCategoryCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return sellingCategoryCollectionViewCell;
    }else if(indexPath.section==7){
        static NSString *identifier = @"SellingCategoryCollectionViewCell";
        SellingCategoryCollectionViewCell *sellingCategoryCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return sellingCategoryCollectionViewCell;
    }else{
        static NSString *identifier = @"ProductsItemCollectionViewCell";
        ProductsItemCollectionViewCell *productsItemCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return productsItemCollectionViewCell;
    }
    

}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==8) {
        if([kind isEqualToString:UICollectionElementKindSectionHeader])
        {
            HomeHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeHeaderCollectionReusableView" forIndexPath:indexPath];
            if(headerView == nil)
            {
                headerView = [[HomeHeaderCollectionReusableView alloc] init];
            }
            
//            headerView.titleLabel.text=@"--还没逛够--";
            return headerView;
        }
        
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==8) {
        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, 60);
    }
    return CGSizeZero;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section==0) {
        
        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, 175*self.view.frame.size.width/375);
    }else if(indexPath.section==1){
        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH/4);
    }else if(indexPath.section==2){
         return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH/2);
    }else if(indexPath.section==3){
        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH+WS_SCREEN_FRAME_WIDTH/2);
    }else if(indexPath.section==4){
        return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH+WS_SCREEN_FRAME_WIDTH/2);
    }else if(indexPath.section==5){
                return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH);
    }else if(indexPath.section==6){
               return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH+WS_SCREEN_FRAME_WIDTH/3);
    }else if(indexPath.section==7){
             return CGSizeMake(WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH+WS_SCREEN_FRAME_WIDTH/3*2);
    }else{
        return CGSizeMake((WS_SCREEN_FRAME_WIDTH)/2, (WS_SCREEN_FRAME_WIDTH)/2+50);
    }
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




- (void)goTodayNewProductsVC
{
    TodayNewProductsListViewController *todayNewProductsListViewController =[[TodayNewProductsListViewController  alloc]init];
    todayNewProductsListViewController.titleString=@"今日新品";
    todayNewProductsListViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:todayNewProductsListViewController animated:YES];
    
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
