//
//  FiveViewController.m
//  Day07-3-Notification
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第五页");
}
- (IBAction)changeRed:(id)sender {
//发送通知,告诉所有收听本频道的控制器,全部把背景色变为红色
//发通知，需要电视台 或者 广播台。
//程序上来说， 需要一个 通知中心
//获取通知中心，通知中心是单例，整个程序独一份
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//使用通知中心发送通知
//NotificationName 通知的名称， 类似于广播的频段，电视的频道
//object 指的是谁发的消息
//userInfo 字典类型， 发送的消息都放在这里
    [center postNotificationName:@"ChangeColor" object:self userInfo:@{@"BGColor": [UIColor redColor]}];
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
