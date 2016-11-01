//
//  ViewController.m
//  Day05-1-LayoutCode
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//一个按钮在视图的右上方，距离右边缘20像素
//如果使用约束，Autolayout之后，不需要使用frame来定义控件的位置和大小。 但是依然可以通过读frame来获取控件位置和大小
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b1 setTitle:@"Button1" forState:UIControlStateNormal];
    b1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:b1];
//加约束之前，必须把控件添加到视图中，否则会报错
    
//关闭视图自身的翻译
//不要将autoResizing中的左和上两根红线变成约束添加进来
    b1.translatesAutoresizingMaskIntoConstraints = NO;
//b1.right = view.right*1 - 20 右边缘
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
//b1.top = view.top*1 + 20 上边缘
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    [self.view addConstraint:c1];
    [self.view addConstraint:c2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
