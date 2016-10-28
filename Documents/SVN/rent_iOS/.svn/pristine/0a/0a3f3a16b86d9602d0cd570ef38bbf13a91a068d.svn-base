//
//  LoginViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "JKCountDownButton.h"
#import "AccountNumberVC.h"
#import "MyViewController.h"
#import "BaseRentBarTableVC.h"
@interface LoginViewController ()<LoginViewAlertShowDelegate,LoginViewBtnToLoginDelegate>

@end

@implementation LoginViewController


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self creatUI];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor cyanColor];
    //设置背景色
    UIImage *barImage = [UIImage imageNamed:@"trans"];
    [self.navigationController.navigationBar setBackgroundImage:barImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];
}

-(void)creatUI{
    
    
    
    LoginView *loginV = [[LoginView alloc]init];
    loginV.alertDelegate = self;
    loginV.loginDelegate = self;
    [self.view addSubview:loginV];
    loginV.center = self.view.center;
    
}

#pragma mark LoginViewAlertShowDelegate方法

-(void)showAlertView:(UIAlertController*)alert{
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)LoginViewToJump{
    //获取帐号信息字典
    NSMutableDictionary* loginDic = [CGFileManager readDocumentfile:kProfileDocument_login ];
    if (!loginDic) {
        loginDic = [NSMutableDictionary dictionary];
    }
    [loginDic setObject:@"YES" forKey:@"isLogin"];
  
    //保存帐号信息字典
    [CGFileManager writeDocumentFile:kProfileDocument_login forObject:loginDic];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];

    
    
    AccountNumberVC *vc = [[AccountNumberVC alloc]init];
    if (self.navigationController) {
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        BaseRentBarTableVC *vc = [[BaseRentBarTableVC alloc]init];
        [self dismissViewControllerAnimated:vc completion:nil];
    }
    
}


@end
