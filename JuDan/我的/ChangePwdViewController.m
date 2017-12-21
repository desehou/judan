//
//  ChangePwdViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/29.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController ()
@property (nonatomic,strong) UITextField *oldPasswordTextField;
@property (nonatomic,strong) UITextField *verificationPasswordTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton *changePwdBtn;
@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"修改密码";
    
    [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    [self initContentView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView
{
    
    
    

    
    self.oldPasswordTextField=[[UITextField alloc]initWithFrame:CGRectMake(30, 64, WS_SCREEN_FRAME_WIDTH-60, 40)];
    self.oldPasswordTextField.placeholder=@"请输入原密码";
    self.oldPasswordTextField.font=[UIFont systemFontOfSize:14];
    self.oldPasswordTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.oldPasswordTextField.textAlignment=NSTextAlignmentLeft;
    self.oldPasswordTextField.keyboardType= UIKeyboardTypeDefault;
    self.oldPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.oldPasswordTextField];
    
    

    
    
    
    self.passwordTextField=[[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.oldPasswordTextField.frame), WS_SCREEN_FRAME_WIDTH-60, 40)];
    self.passwordTextField.placeholder=@"请输入新密码";
    self.passwordTextField.font=[UIFont systemFontOfSize:14];
    self.passwordTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.passwordTextField.textAlignment=NSTextAlignmentLeft;
    self.passwordTextField.keyboardType= UIKeyboardTypeDefault;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.passwordTextField];
    
    
    

    
    
    
    self.verificationPasswordTextField=[[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.passwordTextField.frame), WS_SCREEN_FRAME_WIDTH-60, 40)];
    self.verificationPasswordTextField.placeholder=@"确认新密码";
    self.verificationPasswordTextField.font=[UIFont systemFontOfSize:14];
    self.verificationPasswordTextField.textColor=WS_RGBA(51, 51, 51, 1);
    self.verificationPasswordTextField.textAlignment=NSTextAlignmentLeft;
    self.verificationPasswordTextField.keyboardType= UIKeyboardTypeDefault;
    self.verificationPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.verificationPasswordTextField];
    
    
    
    
    
    
    self.changePwdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.changePwdBtn.frame=CGRectMake(0, WS_SCREEN_FRAME_HEIGHT-40, WS_SCREEN_FRAME_WIDTH, 40);
    [self.changePwdBtn setTitle:@"修改" forState:UIControlStateNormal];
    [self.changePwdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.changePwdBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.changePwdBtn addTarget:self action:@selector(changePwdAction) forControlEvents:UIControlEventTouchUpInside];
    [self.changePwdBtn setBackgroundColor:WS_RGBA(203,103,92,1)];
  
    [self.view addSubview:self.changePwdBtn];
    
    for (int i=1; i<4; i++) {
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(30,64+40*i, WS_SCREEN_FRAME_WIDTH-60, 0.5)];
        lineView.backgroundColor=WS_RGBA(242, 242, 242, 1);
        [self.view addSubview:lineView];
    }
    
   
}

- (void)changePwdAction{
    
    
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
