//
//  AViewController.m
//  Day11-4-TabbarController
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "EViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (id)init{
    if (self = [super init]) {
//设置题目
        self.title = @"A";
//设置图片，两种状态，正常 和 选中
        self.tabBarItem.image = [UIImage imageNamed:@"line_bell"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"full_bell"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//切换到B标签
- (IBAction)gotoB:(id)sender {
//从左往右数，索引值是0，1，2...
    self.tabBarController.selectedIndex = 1;
}
//推入一个E界面，同时隐藏掉tabbar
- (IBAction)pushE:(id)sender {
    EViewController *eVC = [EViewController new];
//隐藏下方的tabbar
    eVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:eVC animated:YES];
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
