//
//  ViewController.m
//  Day14-2-GotoOtherXib
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//跳转到B控制器，B控制器是Xib搭建的
- (IBAction)click:(id)sender {
    BViewController *bVC = [BViewController new];
    [self presentViewController:bVC animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
