//
//  ViewController.m
//  Day04-3-AutoResizingCode
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"button1" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    button.frame = CGRectMake(self.view.bounds.size.width - 120, 40, 100, 40);
    [self.view addSubview:button];
    
//使用autoResizing保持按钮离右边缘一段距离
//从视图上说，就是点亮 上和右的外侧红线//代码写的正好相反
    button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
