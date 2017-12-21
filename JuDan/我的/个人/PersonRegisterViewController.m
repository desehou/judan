//
//  PersonRegisterViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "PersonRegisterViewController.h"

@interface PersonRegisterViewController ()

@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *verificationPasswordTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UILabel *tipsLabel;
@property (nonatomic,strong) UIButton *registerBtn;


@end

@implementation PersonRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"个人注册";
    
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
    
    
    
    UILabel *vPasswordLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.passwordTextField.frame), 84, 40)];
    vPasswordLabel.textAlignment=NSTextAlignmentLeft;
    vPasswordLabel.textColor=WS_RGBA(200, 200, 200, 1);
    vPasswordLabel.font=[UIFont systemFontOfSize:14];
    vPasswordLabel.text=@"确认密码";
    [self.view addSubview:vPasswordLabel];
    
    
    
    self.verificationPasswordTextField=[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(vPasswordLabel.frame), CGRectGetMaxY(self.passwordTextField.frame), WS_SCREEN_FRAME_WIDTH-CGRectGetMaxX(userNameLabel.frame)-30, 40)];
    self.verificationPasswordTextField.placeholder=@"请填写您的密码";
    self.verificationPasswordTextField.font=[UIFont systemFontOfSize:14];
    self.verificationPasswordTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.verificationPasswordTextField.textAlignment=NSTextAlignmentLeft;
    self.verificationPasswordTextField.keyboardType= UIKeyboardTypeDefault;
    self.verificationPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.verificationPasswordTextField];
    
   
    
    

    
    self.registerBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.registerBtn.frame=CGRectMake(30, CGRectGetMaxY(self.verificationPasswordTextField.frame)+30, WS_SCREEN_FRAME_WIDTH-60, 40);
    [self.registerBtn setTitle:@"同意条款并注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn setBackgroundColor:WS_RGBA(153,153,153,1)];
    self.registerBtn.layer.cornerRadius=1;
    self.registerBtn.layer.masksToBounds=YES;
    [self.view addSubview:self.registerBtn];
    
    for (int i=1; i<4; i++) {
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(30,64+40*i, WS_SCREEN_FRAME_WIDTH-60, 0.5)];
        lineView.backgroundColor=WS_RGBA(242, 242, 242, 1);
        [self.view addSubview:lineView];
    }
    
    
    
    self.tipsLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.registerBtn.frame)+40, WS_SCREEN_FRAME_WIDTH-60, 20)];
    self.tipsLabel.textAlignment=NSTextAlignmentCenter;
    self.tipsLabel.textColor=WS_RGBA(200, 200, 200, 1);
    self.tipsLabel.font=[UIFont systemFontOfSize:14];
    
    [self.view addSubview:self.tipsLabel];
    
    NSMutableAttributedString *tipsString = [[NSMutableAttributedString alloc] initWithString:@"阅读 《聚单商场用户协议》"];
    NSRange colorRange = NSMakeRange([[tipsString string] rangeOfString:@"《聚单商场用户协议》"].location, [[tipsString string] rangeOfString:@"《聚单商场用户协议》"].length);
    
    [tipsString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:colorRange];
    
    [self.tipsLabel setAttributedText:tipsString];
    
}

- (void)registerAction{
    
    
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
