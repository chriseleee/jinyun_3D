//
//  ViewController.m
//  Day01-0-Category
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Art.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//通过三原色设置self.view的背景色
//人类使用三原色范围是0~255
//但是UIColor的类方法要求取值范围是0~1
//所以我们需要自己除以255.0
    self.view.backgroundColor = [UIColor colorWithRed:120/255.0 green:150/255.0 blue:123/255.0 alpha:1.0];
//能不能UIColor提供一个类方法，直接传入0~255这个数字就可以了呢？
    self.view.backgroundColor = [UIColor colorWith255R:170 G:30 B:25];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
