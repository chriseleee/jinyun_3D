//
//  CViewController.m
//  Day11-4-TabbarController
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController
- (id)init{
    if (self = [super init]) {
        self.title = @"C";
        self.tabBarItem.image = [UIImage imageNamed:@"line_cart"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"full_cart"];
//设置徽章值
        self.tabBarItem.badgeValue = @"11";
    }
    return self;
}
//只要C界面出现，就把徽章值去掉
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarItem.badgeValue = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
