//
//  ViewController.m
//  Day05-2-Layout-VFL
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
//三个按钮，横向排列，宽度相等，距离上，左，右屏幕边缘20像素，按钮间距10像素
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b1 setTitle:@"确定" forState:UIControlStateNormal];
    b1.backgroundColor = [UIColor lightGrayColor]
    ;
    [self.view addSubview:b1];
    
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b2 setTitle:@"取消" forState:UIControlStateNormal];
    b2.backgroundColor = [UIColor lightGrayColor]
    ;
    [self.view addSubview:b2];
//三个按钮题目为  确认  取消  重试
    UIButton *b3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [b3 setTitle:@"重试" forState:UIControlStateNormal];
    b3.backgroundColor = [UIColor lightGrayColor]
    ;
    [self.view addSubview:b3];
    
//预备步骤  关闭自动翻译功能
    b1.translatesAutoresizingMaskIntoConstraints = NO;
    b2.translatesAutoresizingMaskIntoConstraints = NO;
    b3.translatesAutoresizingMaskIntoConstraints = NO;
//准备一个VFL
    NSString *hVFL = @"|-left-[b1]-spacing-[b2(b1)]-spacing-[b3(b1)]-right-|";
//为VFL柿子中的一些特殊含义的数字做一个名称对照表
    NSDictionary *dic1 = @{@"top":@20, @"left":@20, @"right":@20, @"spacing": @10};
//下面的宏定义方法，传入的这些对象，会自动的生成一个字典
//例如传入b1,b2,b3 会自动生成字典
//@{@"b1":b1, @"b2":b2, @"b3":b3}
    NSDictionary *dic2 = NSDictionaryOfVariableBindings(b1,b2,b3);
//创建约束
    NSArray *cs1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllCenterY metrics:dic1 views:dic2];
    [self.view addConstraints:cs1]; //注意带s
    
//距离上边缘
    NSString *vVFL = @"V:|-top-[b1]";
    NSArray *cs2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:dic1 views:dic2];
    [self.view addConstraints:cs2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
