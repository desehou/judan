//
//  PurchaseViewController.m
//  JuDan
//
//  Created by desehou on 2017/10/17.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "PurchaseViewController.h"
#import "PurchaseTableViewCell.h"

@interface PurchaseViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>
{
    
    int list_page;
}
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation PurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"采购库";
    
    
    UIButton *purchaseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    purchaseBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [purchaseBtn setTitle:@"采购需求" forState:UIControlStateNormal];
    [purchaseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [purchaseBtn addTarget:self action:@selector(publishPurchase) forControlEvents:UIControlEventTouchUpInside];
    [purchaseBtn setBackgroundColor:WS_RGBA(219,99,50,1)];
    purchaseBtn.layer.cornerRadius=10/2;
    purchaseBtn.layer.masksToBounds=YES;
    self.navigationController.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:purchaseBtn];
 
    [self initContentView];
    [self addHeader];
    [self addFooter];
    
}
- (void)initContentView{

    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_HEIGHT-49) style:UITableViewStylePlain];
    self.tableView.backgroundColor=WS_RGBA(242, 242, 242, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    UISearchController *searchController= [[UISearchController alloc] init];
    searchController.searchBar.frame=CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, 44);
    self.tableView.tableHeaderView=searchController.searchBar;
    searchController.searchResultsUpdater=self;
    
    searchController.searchBar.delegate=self;
    
    searchController.searchBar.placeholder=@"搜索"; // placeholder
    searchController.searchBar.tintColor=WS_RGB(225,225,225);// 设置搜索框内按钮文字颜色，以及搜索光标颜色。
    
    searchController.searchBar.barTintColor=[UIColor whiteColor];// 设置搜索框背景颜色
        [self.view addSubview:self.tableView];
    
    
    
}
- (void)publishPurchase{
    
    
}



-(void)addHeader{
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        list_page = 1;
        [self purchaseRequsest];
    }];
}
-(void)addFooter{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(purchaseRequsest)];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    self.tableView.mj_footer = footer;
}

- (void)purchaseRequsest
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return 100;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
        static NSString *UITableViewCellIdentifier = @"PurchaseTableViewCell";
        PurchaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
        if (!cell) {
            cell = [[PurchaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellIdentifier];
        }
        
        //        [cell.goods_pic sd_setImageWithURL:[NSURL URLWithString:@""]
        //                          placeholderImage:[UIImage imageNamed:@"goods1"]];
        cell.pic.image=[UIImage imageNamed:@"goods1"];
        
        cell.name.text=@"批发GP车队纪念版明星同款银灰色赛车难户外运动鸭舌棒球帽";

    
    NSMutableAttributedString *endTimeString = [[NSMutableAttributedString alloc] initWithString:@"剩余天数:  2天"];
    NSRange colorRange = NSMakeRange([[endTimeString string] rangeOfString:@"剩余天数:  "].location, [[endTimeString string] rangeOfString:@"剩余天数:  "].length);
    
     [endTimeString addAttribute:NSForegroundColorAttributeName value:WS_RGBA(153, 153, 153, 1) range:colorRange];
    
    [cell.end_time setAttributedText:endTimeString];
        return cell;

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
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
