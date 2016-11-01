//
//  ViewController.m
//  Day02-6-UIButton
//
//  Created by tarena on 15/7/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//UIButtonTypeSystem风格 会自动把高亮状态的按钮添加一个透明图，会发虚。
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(30, 100, 100, 100);
// 设置按钮正常状态图片
    UIImage *image = [UIImage imageNamed:@"Writeoffs_btn"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
// 设置按钮高亮状态的背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"Writeoffs_btn_Press"] forState:UIControlStateHighlighted];
    
//按钮2，设置按钮文字大小
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(30, 200, 80, 40);
    [btn1 setTitle:@"按钮2" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    btn1.titleLabel.font = [UIFont systemFontOfSize:30];
//    设置按钮为disable状态
    btn1.enabled = NO;
//    被选择状态
    btn1.selected = YES;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
