//
//  PersonLoginViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "PersonLoginViewController.h"
#import "PersonRegisterViewController.h"
#import "ChangePwdViewController.h"

@interface PersonLoginViewController ()
@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UILabel *autoLoginLabel;
@property (nonatomic,strong) UILabel *registerLabel;
@property (nonatomic,strong) UIButton *autoLoginBtn;
@property (nonatomic,strong) UIButton *forgetPwdBtn;
@property (nonatomic,strong) UIButton *loginPwdBtn;
@end

@implementation PersonLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"用户登录";
    
    [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    [self initContentView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView
{
    
    
    
    UILabel *userNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 64, 84, 40)];
    userNameLabel.textAlignment=NSTextAlignmentLeft;
    userNameLabel.textColor=WS_RGBA(200, 200, 200, 1);
    userNameLabel.font=[UIFont systemFontOfSize:14];
    userNameLabel.text=@"用户名";
    [self.view addSubview:userNameLabel];
    
    self.userNameTextField=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userNameLabel.frame), 64, WS_SCREEN_FRAME_WIDTH-CGRectGetMaxX(userNameLabel.frame)-30, 40)];
    self.userNameTextField.placeholder=@"请填写您的用户名";
    self.userNameTextField.font=[UIFont systemFontOfSize:14];
    self.userNameTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.userNameTextField.textAlignment=NSTextAlignmentLeft;
    self.userNameTextField.keyboardType= UIKeyboardTypeDefault;
    self.userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.userNameTextField];
    
    
    UILabel *passwordLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.userNameTextField.frame), 84, 40)];
    passwordLabel.textAlignment=NSTextAlignmentLeft;
    passwordLabel.textColor=WS_RGBA(200, 200, 200, 1);
    passwordLabel.font=[UIFont systemFontOfSize:14];
    passwordLabel.text=@"密码";
    [self.view addSubview:passwordLabel];
    
    
    
    self.passwordTextField=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(passwordLabel.frame), CGRectGetMaxY(self.userNameTextField.frame), WS_SCREEN_FRAME_WIDTH-CGRectGetMaxX(userNameLabel.frame)-30, 40)];
    self.passwordTextField.placeholder=@"请填写您的密码";
    self.passwordTextField.font=[UIFont systemFontOfSize:14];
    self.passwordTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.passwordTextField.textAlignment=NSTextAlignmentLeft;
    self.passwordTextField.keyboardType= UIKeyboardTypeDefault;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.passwordTextField];
    
    
    
    
    self.autoLoginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.autoLoginBtn.frame=CGRectMake(30, CGRectGetMaxY(self.passwordTextField.frame)+15, 10, 10);
    [self.autoLoginBtn setSelected:NO];
    [self.autoLoginBtn addTarget:self action:@selector(autoLoginAction) forControlEvents:UIControlEventTouchUpInside];
    self.autoLoginBtn.layer.cornerRadius=2;
    self.autoLoginBtn.layer.masksToBounds=YES;
    self.autoLoginBtn.layer.borderWidth = 1;
    self.autoLoginBtn.layer.borderColor = [WS_RGBA(153,153,153,1) CGColor];
    
    [self.view addSubview:self.autoLoginBtn];
    
    
    self.autoLoginLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.autoLoginBtn.frame)+5, CGRectGetMaxY(self.passwordTextField.frame)+10, 80, 20)];
    self.autoLoginLabel.textAlignment=NSTextAlignmentLeft;
    self.autoLoginLabel.textColor=WS_RGBA(156, 156, 156, 1);
    self.autoLoginLabel.font=[UIFont systemFontOfSize:12];
    self.autoLoginLabel.text=@"自动登录";
    [self.view addSubview:self.autoLoginLabel];
    
    
    self.forgetPwdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetPwdBtn.frame=CGRectMake(WS_SCREEN_FRAME_WIDTH-110, CGRectGetMaxY(self.passwordTextField.frame)+10, 80, 20);
    [self.forgetPwdBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.forgetPwdBtn setTitleColor:WS_RGBA(156, 156, 156, 1) forState:UIControlStateNormal];
    self.forgetPwdBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.forgetPwdBtn addTarget:self action:@selector(forgetPwdAction) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:self.forgetPwdBtn];
    
  
    
    
    
    self.loginPwdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.loginPwdBtn.frame=CGRectMake(30, CGRectGetMaxY(self.passwordTextField.frame)+40, WS_SCREEN_FRAME_WIDTH-60, 40);
    [self.loginPwdBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginPwdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginPwdBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.loginPwdBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.loginPwdBtn setBackgroundColor:WS_RGBA(153,153,153,1)];

    [self.view addSubview:self.loginPwdBtn];
    
    for (int i=1; i<3; i++) {
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(30,64+40*i, WS_SCREEN_FRAME_WIDTH-60, 0.5)];
        lineView.backgroundColor=WS_RGBA(242, 242, 242, 1);
        [self.view addSubview:lineView];
    }
    
    
    
    self.registerLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.loginPwdBtn.frame)+40, WS_SCREEN_FRAME_WIDTH-60, 20)];
    self.registerLabel.textAlignment=NSTextAlignmentCenter;
    self.registerLabel.textColor=WS_RGBA(156, 156, 156, 1);
    self.registerLabel.font=[UIFont systemFontOfSize:14];
    
    [self.view addSubview:self.registerLabel];
    
    self.registerLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(registerAction)];
    
    [self.registerLabel addGestureRecognizer:labelTapGestureRecognizer];
    
    
    NSMutableAttributedString *tipsString = [[NSMutableAttributedString alloc] initWithString:@"还没有账号？ 免费注册"];
    NSRange colorRange = NSMakeRange([[tipsString string] rangeOfString:@"免费注册"].location, [[tipsString string] rangeOfString:@"免费注册"].length);
    
    [tipsString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:colorRange];
    
    [self.registerLabel setAttributedText:tipsString];
    
}




- (void)loginAction{
    
    
}
- (void)registerAction{
    PersonRegisterViewController *personRegisterViewController=[[PersonRegisterViewController alloc]init];
    [self.navigationController pushViewController:personRegisterViewController animated:YES];
    
}
- (void)forgetPwdAction{
    ChangePwdViewController *changePwdViewController=[[ChangePwdViewController alloc]init];
    [self.navigationController pushViewController:changePwdViewController animated:YES];
    
}
- (void)autoLoginAction{
    
    if (self.autoLoginBtn.isSelected) {
        [self.autoLoginBtn setSelected:NO];
        [self.autoLoginBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else{
        
        [self.autoLoginBtn setSelected:YES];
        [self.autoLoginBtn setImage:[UIImage imageNamed:@"aotulogin"] forState:UIControlStateNormal];
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
