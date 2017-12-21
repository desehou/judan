//
//  SettingViewController.m
//  JuDan
//
//  Created by junli hou on 2017/12/2.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController() <UITableViewDelegate,UITableViewDataSource>
{
    
    int list_page;
}
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"设置";
    
      [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    
    

    [self initContentView];

    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView{
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor=WS_RGBA(242, 242, 242, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:self.tableView];
    
    
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return 3;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *UITableViewCellIdentifier = @"SettingTableViewCell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
    if (!cell) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellIdentifier];
    }

    if (indexPath.row==0) {
        cell.iconImageView.image=[UIImage imageNamed:@"xiugai_mima"];
        cell.titleLabel.text=@"修改密码";
    }else if(indexPath.row==1){
        cell.iconImageView.image=[UIImage imageNamed:@"call_numner"];
        cell.titleLabel.text=@"联系我们";
        cell.dicTextLabel.text=@"客服电话541236584";
    }else{
        cell.iconImageView.image=[UIImage imageNamed:@"like_weixin"];
        cell.titleLabel.text=@"关注聚单商场微信";
    }

    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
   
    return cell;
    
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
