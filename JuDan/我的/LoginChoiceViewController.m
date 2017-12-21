//
//  LoginChoiceViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "LoginChoiceViewController.h"
#import "PersonLoginViewController.h"
#import "BizLoginViewController.h"

@interface LoginChoiceViewController ()
@property (nonatomic,strong) UIButton *personLoginBtn;
@property (nonatomic,strong) UIButton *bizLoginBtn;
@end

@implementation LoginChoiceViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"登录";
    
    [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    [self initContentView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView
{
   
    
    self.personLoginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.personLoginBtn.frame=CGRectMake(50, 50+64, WS_SCREEN_FRAME_WIDTH-100, 50);
    [self.personLoginBtn setTitle:@"我是个人账号" forState:UIControlStateNormal];
    [self.personLoginBtn setTitleColor:WS_RGBA(153,153,153,1) forState:UIControlStateNormal];
    self.personLoginBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.personLoginBtn addTarget:self action:@selector(personLoginAction) forControlEvents:UIControlEventTouchUpInside];
    self.personLoginBtn.layer.cornerRadius=10;
    self.personLoginBtn.layer.masksToBounds=YES;
    self.personLoginBtn.layer.borderWidth = 1;
    self.personLoginBtn.layer.borderColor = [WS_RGBA(153,153,153,1) CGColor];
    [self.view addSubview:self.personLoginBtn];
    
    self.bizLoginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.bizLoginBtn.frame=CGRectMake(50, CGRectGetMaxY(self.personLoginBtn.frame)+30, WS_SCREEN_FRAME_WIDTH-100, 50);
    [self.bizLoginBtn setTitle:@"我是企业账号" forState:UIControlStateNormal];
    [self.bizLoginBtn setTitleColor:WS_RGBA(153,153,153,1) forState:UIControlStateNormal];
    self.bizLoginBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.bizLoginBtn addTarget:self action:@selector(bizLoginAction) forControlEvents:UIControlEventTouchUpInside];
    self.bizLoginBtn.layer.cornerRadius=10;
    self.bizLoginBtn.layer.masksToBounds=YES;
    self.bizLoginBtn.layer.borderWidth = 1;
    self.bizLoginBtn.layer.borderColor = [WS_RGBA(153,153,153,1) CGColor];
    [self.view addSubview:self.bizLoginBtn];


    
}

- (void)personLoginAction{
    PersonLoginViewController *personLoginViewController=[[PersonLoginViewController alloc]init];
    [self.navigationController pushViewController:personLoginViewController animated:YES];
    
}

- (void)bizLoginAction{
    BizLoginViewController *bizLoginViewController=[[BizLoginViewController alloc]init];
    [self.navigationController pushViewController:bizLoginViewController animated:YES];
    
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
