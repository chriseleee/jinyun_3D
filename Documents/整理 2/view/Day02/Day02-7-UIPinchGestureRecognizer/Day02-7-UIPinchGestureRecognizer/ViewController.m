//
//  ViewController.m
//  Day02-7-UIPinchGestureRecognizer
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
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
}
- (void)pinch:(UIPinchGestureRecognizer *)gr{
//手势的速率，手势动作的快慢
    CGFloat velocity = gr.velocity;
//手势捏合或者外扩时，两触点之间距离的放大或者缩小的倍数
    CGFloat scale = gr.scale;
    NSLog(@"velocity %f, scale %f", velocity, scale);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
