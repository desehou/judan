//
//  CategoryViewController.m
//  JuDan
//
//  Created by desehou on 2017/10/17.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "CategoryViewController.h"
#import "HaiTaoCateGoriesTableViewCell.h"
#import "HaiTaoCateGoriesCollectionViewCell.h"
#import "HaiTaoCateGoriesHeadCollectionReusableView.h"
#import "HaiTaoCateGoriesFlowLayout.h"
#import "UILabel+LabelHeightAndWidth.h"
@interface CategoryViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
{
    NSInteger  select_row;
    UIView *line;
}
@property (nonatomic, strong)  UITableView *table;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HaiTaoCateGoriesFlowLayout *layout;

@property (nonatomic) UIEdgeInsets contentInsets; //default is (10,10,10,10)

@property (nonatomic)  NSMutableArray *categoriesData;   //总数据源
@property (nonatomic)  NSMutableArray *childrenCategoriesData;   //二级数据源
@property (nonatomic)  NSMutableArray *grandchildrenCategoriesData;   //三级数据源
@property (strong, nonatomic) NSMutableArray<HaiTaoCategoryModel *> *tagModels;
@property (nonatomic) CGFloat lineSpacing;       //行间距, 默认为10
@property (nonatomic) CGFloat interitemSpacing; //元素
@property (nonatomic) UIEdgeInsets tagInsets;
@property (nonatomic) CGFloat tagHeight;        //标签高度，默认28
@property (nonatomic) CGFloat mininumTagWidth;  //tag 最小宽度值, 默认是0，即不作最小宽度限制
@property (nonatomic) CGFloat maximumTagWidth;  //tag 最大宽度值, 默认是CGFLOAT_MAX， 即不作最大宽度限制

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"类别";
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 135*WS_SCREEN_FRAME_WIDTH/375, WS_SCREEN_FRAME_HEIGHT-49) style:UITableViewStylePlain];
    self.table.delegate=self;
    self.table.dataSource=self;
    self.table.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor=WS_RGBA(255, 255, 255, 1);
    [self.view addSubview: self.table];
    
    self.layout=[[HaiTaoCateGoriesFlowLayout alloc]init];
    self.layout.rowHeight = 28.f;
    
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(135*WS_SCREEN_FRAME_WIDTH/375, 0,WS_SCREEN_FRAME_WIDTH-135*WS_SCREEN_FRAME_WIDTH/375, WS_SCREEN_FRAME_HEIGHT-49) collectionViewLayout:self.layout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor= WS_RGBA(255, 255, 255, 1);
    [self.collectionView registerClass:[HaiTaoCateGoriesCollectionViewCell class] forCellWithReuseIdentifier:@"HaiTaoCateGoriesCollectionViewCell"];
    [self.collectionView registerClass:[HaiTaoCateGoriesHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HaiTaoCateGoriesHeadCollectionReusableView"];
    [self.collectionView registerClass:[HaiTaoCateGoriesHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HaiTaoCateGoriesFooterCollectionReusableView"];
    self.collectionView.alwaysBounceVertical = YES;
    //    self.layout.headerReferenceSize = CGSizeMake(KScreen_Frame_Width, 35);
    //    self.layout.footerReferenceSize = CGSizeMake(KScreen_Frame_Width, 10);
    [self.view addSubview:self.collectionView];
    
    
    line=[[UIView alloc]initWithFrame:CGRectMake(135*WS_SCREEN_FRAME_WIDTH/375, 0, 0.5, WS_SCREEN_FRAME_HEIGHT-49)];
    line.backgroundColor=WS_RGBA(229, 229, 229, 1);
    [self.view addSubview:line];
    
    
    _contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    _tagInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    
    _tagHeight = 28;
    _mininumTagWidth = 0;
    _maximumTagWidth = CGFLOAT_MAX;
    _lineSpacing = 10;
    _interitemSpacing = 5;
    
    
    
    select_row=0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.categoriesData.count;
    
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}








-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *HaiTaoCateGoriesIdentifier = @"HaiTaoCateGoriesTableViewCell";
    HaiTaoCateGoriesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:HaiTaoCateGoriesIdentifier];
    if (cell == nil) {
        cell=[[HaiTaoCateGoriesTableViewCell alloc]initWithFrame:CGRectMake(0, 0, 135*WS_SCREEN_FRAME_WIDTH/375, 50)];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    NSDictionary *categoryDic=[self.categoriesData objectAtIndex:indexPath.row];
//    cell.category.text=[categoryDic objectForKey:@"name"];
    cell.category.text=@"汽车配件";
    if (select_row==indexPath.row) {
        cell.category.textColor=[UIColor whiteColor];
        cell.category.backgroundColor=WS_RGBA(64, 64, 64, 1);
    }else{
        cell.category.textColor=WS_RGBA(51, 51, 51, 0.6);
        cell.category.backgroundColor=[UIColor clearColor];
    }
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    select_row=indexPath.row;
    
//    NSDictionary *childrenDic=[self.categoriesData objectAtIndex:select_row];
//
//    [self.childrenCategoriesData removeAllObjects];
//    [self.childrenCategoriesData addObjectsFromArray:(NSArray *)[childrenDic objectForKey:@"children"]];

    
    [tableView reloadData];
    [self.collectionView reloadData];
}



#pragma mark -- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
//    return self.childrenCategoriesData.count;
    return 3;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    NSDictionary *childrenDic=[self.childrenCategoriesData objectAtIndex:section];
//    NSArray *childrenArray=  (NSArray *)[childrenDic objectForKey:@"children"];
//    return  childrenArray.count;
    return 10;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *identifier = @"HaiTaoCateGoriesCollectionViewCell";
    HaiTaoCateGoriesCollectionViewCell *haiTaoCateGoriesCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    NSDictionary *childrenDic=[self.childrenCategoriesData objectAtIndex:indexPath.section];
//    NSArray *childrenArray=  (NSArray *)[childrenDic objectForKey:@"children"];
//    NSDictionary *grandchildrenDic=[childrenArray objectAtIndex:indexPath.row];
    haiTaoCateGoriesCollectionViewCell.category_name.text=@"汽车坐垫";
    
    haiTaoCateGoriesCollectionViewCell.contentInsets = self.tagInsets;
    return haiTaoCateGoriesCollectionViewCell;
    
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HaiTaoCateGoriesHeadCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HaiTaoCateGoriesHeadCollectionReusableView" forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[HaiTaoCateGoriesHeadCollectionReusableView alloc] init];
        }
//        NSDictionary *childrenDic=[self.childrenCategoriesData objectAtIndex:indexPath.section];
//        headerView.category_title.text=[NSString stringWithFormat:@"・%@",[childrenDic objectForKey:@"name"]];
         headerView.category_title.text=[NSString stringWithFormat:@"・%@",@"坐垫"];
        headerView.backgroundColor=[UIColor whiteColor];
        return headerView;
    }else{
        HaiTaoCateGoriesHeadCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HaiTaoCateGoriesFooterCollectionReusableView" forIndexPath:indexPath];
        if(footerView == nil)
        {
            footerView = [[HaiTaoCateGoriesHeadCollectionReusableView alloc] init];
        }
        footerView.backgroundColor=[UIColor blueColor];
        return footerView;
        
    }
    
}
#pragma mark - ......::::::: UICollectionViewDelegateFlowLayout :::::::......

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSDictionary *childrenDic=[self.childrenCategoriesData objectAtIndex:indexPath.section];
//    NSArray *childrenArray=  (NSArray *)[childrenDic objectForKey:@"children"];
//    NSDictionary *grandchildrenDic=[childrenArray objectAtIndex:indexPath.row];
    
//    CGFloat label_width= [UILabel getWidthWithTitle:[grandchildrenDic objectForKey:@"name"] font:[UIFont systemFontOfSize:13]];
    CGFloat label_width= [UILabel getWidthWithTitle:@"汽车坐垫" font:[UIFont systemFontOfSize:13]];
    CGFloat width = label_width + self.tagInsets.left + self.tagInsets.right;
    if (width < self.mininumTagWidth) {
        width = self.mininumTagWidth;
    }
    if (width > self.maximumTagWidth) {
        width = self.maximumTagWidth;
    }
    
    return CGSizeMake(width, self.tagHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.interitemSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.lineSpacing;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.contentInsets;
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
