//
//  ViewController.m
//  Day03-4-UIAlertViewDelegate
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAlertView:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
    [alertView show];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//  单独设置本身为UIAlertView的代理方
//    alertView.delegate = self;
}
//触发时机:AlertView中的按钮被点击时
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clicked %ld", buttonIndex);
//  当用户点击Other按钮时，显示用户输入的登录名和密码
    if (buttonIndex == 1) {
//获取alertView中的两个文本框的值
        UITextField *nameTF = [alertView textFieldAtIndex:0];
        UITextField *pwdTF = [alertView textFieldAtIndex:1];
        NSLog(@"name %@, pwd %@", nameTF.text, pwdTF.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
