//
//  ViewController.m
//  Day02-6-UILongPressGestureRecognizer
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
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.view addGestureRecognizer:longPressGR];
//最低按几秒钟触发
    longPressGR.minimumPressDuration = 4;
}
- (void)longPress:(UILongPressGestureRecognizer *)gr{
    CGPoint point = [gr locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
