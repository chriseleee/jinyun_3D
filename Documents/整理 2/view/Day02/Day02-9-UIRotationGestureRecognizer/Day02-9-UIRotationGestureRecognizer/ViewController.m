//
//  ViewController.m
//  Day02-9-UIRotationGestureRecognizer
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
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotationGR];
}
- (void)rotation:(UIRotationGestureRecognizer *)gr{
//获取旋转的角度
    CGFloat angle = gr.rotation;
    NSLog(@"%f", angle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
