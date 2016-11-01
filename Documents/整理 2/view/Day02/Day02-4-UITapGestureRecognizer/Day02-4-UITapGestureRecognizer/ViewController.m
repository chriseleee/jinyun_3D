//
//  ViewController.m
//  Day02-4-UITapGestureRecognizer
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//添加一个灰色的UIView，当双击这个视图时，打印出被双击位置的坐标
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
//添加双击手势
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//设置触发操作需要的点按次数
    tapGR.numberOfTapsRequired = 2;
//设置需要几根手指来触发这个操作，默认是一根
    tapGR.numberOfTouchesRequired = 1;
//把手势添加到灰色的视图上
    [grayView addGestureRecognizer:tapGR];
    
}
- (void)tap:(UITapGestureRecognizer *)gr{
//打印触点的坐标
    CGPoint point = [gr locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
