//
//  ViewController.m
//  Demo02-MainThread-Block
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startTimingOperation:(id)sender {
    
    //模拟耗时的操作
    for (int i = 0; i < 30000; i++) {
        NSLog(@"当前运行次数:%d", i);
    }
}







@end
