//
//  ViewController.m
//  Day02-5-UISwipeGestureRecognizer
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
    UISwipeGestureRecognizer *swipeGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeGR.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGR];
}
- (void)swipe:(UISwipeGestureRecognizer *)gr{
    NSLog(@"...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
