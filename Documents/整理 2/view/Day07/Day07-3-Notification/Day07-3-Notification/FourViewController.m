//
//  FourViewController.m
//  Day07-3-Notification
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第四页");
//注册成为某个消息的观察者
//可以认为是收听某个频道 或者 查看收看某电视台
//找到通知中心，添加对某通知的关注
//addObserver 添加观察者
//selector 当接到某个通知以后 执行的方法
//name 频道名， 通知名
//object 指定收听某个对象的通知,传nil代表收听所有对象的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"ChangeColor" object:nil];
}
//NSNotification 是 通知的类型
- (void)receiveNotification:(NSNotification *)notification{
//获取通知的消息内容
    NSDictionary *info = notification.userInfo;
//改变颜色
    self.view.backgroundColor = info[@"BGColor"];
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
