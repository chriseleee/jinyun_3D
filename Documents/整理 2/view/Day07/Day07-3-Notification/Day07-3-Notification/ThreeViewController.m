//
//  ThreeViewController.m
//  Day07-3-Notification
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第三页");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"ChangeColor" object:nil];
}
- (void)receiveNotification:(NSNotification *)notification{
    self.view.backgroundColor = notification.userInfo[@"BGColor"];
}
//当界面从内存中删除掉的时候，需要去掉通知中心中的注册
- (void)dealloc{
//这个方法，在对象从内存中删除时，自动执行，我们可以重写，来掌握这个时间点
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
