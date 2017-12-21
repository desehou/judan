//
//  BizRegisterViewController.m
//  JuDan
//
//  Created by junli hou on 2017/11/23.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "BizRegisterViewController.h"

@interface BizRegisterViewController ()

@end

@implementation BizRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"企业注册";
    
    [self.navigationController addBackBtnWithTarget:self action:@selector(back)];
    [self initContentView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initContentView
{
    UILabel *tipsLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 64+30, WS_SCREEN_FRAME_WIDTH-60, 60)];
    tipsLabel.textAlignment=NSTextAlignmentLeft;
    tipsLabel.textColor=[UIColor redColor];
    tipsLabel.font=[UIFont systemFontOfSize:16];
    tipsLabel.text=@"抱歉，企业注册请到电脑上操作，需要上传企业资质证书复印件等其相关资料，感谢您的配合。";
    tipsLabel.numberOfLines=5;
    [self.view addSubview:tipsLabel];
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
