//
//  ViewController.m
//  Day03-3-AlertView
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAlertView:(id)sender {
//弹出提示框
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
//    显示提示框
    [alertView show];
}
//多按钮的提示框
- (IBAction)showAlertView1:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"1", @"2", @"3", nil];
    [alertView show]; //显示出来
}
//带输入框的
- (IBAction)showAlertView2:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
    [alertView show];
//    设置风格
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
