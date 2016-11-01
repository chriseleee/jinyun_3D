//
//  ViewController.m
//  Day02-8-UIPanGestureRecognizer
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIView *_grayView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    _grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_grayView];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_grayView addGestureRecognizer:panGR];
}
- (void)pan:(UIPanGestureRecognizer *)gr{
//记录的是当前触点在视图的坐标系下的点的坐标值
    CGPoint location = [gr locationInView:self.view];
    NSLog(@"location %@", NSStringFromCGPoint(location));
//通常我们需要的是位移，我们可以通过translation方法获得位移
    CGPoint translation = [gr translationInView:self.view];
    NSLog(@"位移 %@", NSStringFromCGPoint(translation));
//把位移量 添加到灰色视图的坐标上
    _grayView.center = CGPointMake(_grayView.center.x + translation.x, _grayView.center.y + translation.y);
//每次移动完之后，把位移重置
    [gr setTranslation:CGPointZero inView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
