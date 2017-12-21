//
//  MeViewController.m
//  JuDan
//
//  Created by desehou on 2017/10/17.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "MeViewController.h"
#import "LoginChoiceViewController.h"
#import "SettingViewController.h"
#import "MeHeaderView.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)MeHeaderView *meHeaderView;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"我的";
    self.view.backgroundColor=[UIColor whiteColor];
    [self initContentView];
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)initContentView{

    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor=WS_RGBA(242, 242, 242, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
    self.meHeaderView=[[MeHeaderView alloc]initWithFrame:CGRectMake(0, 0, WS_SCREEN_FRAME_WIDTH, WS_SCREEN_FRAME_WIDTH/3)];
    self.tableView.tableHeaderView=self.meHeaderView;
    
    

    
    [self.view addSubview:self.tableView];
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *UITableViewCellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellIdentifier];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row==0) {
          cell.textLabel.text=@"注册";
    }else if (indexPath.row==1){
        cell.textLabel.text=@"登录";
    }else if (indexPath.row==2){
        cell.textLabel.text=@"用户帮助";
    }else if (indexPath.row==3){
         cell.textLabel.text=@"关于我们";
    }
  
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textColor=WS_RGB(51, 51, 51);
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        LoginChoiceViewController *loginChoiceViewController=[[LoginChoiceViewController alloc]init];
        loginChoiceViewController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:loginChoiceViewController animated:YES];
        
    }else{
        SettingViewController *settingViewController=[[SettingViewController alloc]init];
        settingViewController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:settingViewController animated:YES];
        
        
        
    }

    

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
