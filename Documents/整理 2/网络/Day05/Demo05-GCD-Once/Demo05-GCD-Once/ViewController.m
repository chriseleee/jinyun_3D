//
//  ViewController.m
//  Demo05-GCD-Once
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 0; i < 20; i++) {
        NSLog(@"运行次数:%d", i);
        
        //dispatch_once
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSLog(@"======只运行一次=====");
        });
    }
}



@end
