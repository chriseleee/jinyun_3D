//
//  ViewController.m
//  BreakPoint
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 50; i ++) {
        NSLog(@"%d", i);
    }
    NSArray *arr = @[@"111", @"2", @"3"];
    NSString *s1 = @"adfas";
    NSString *s2 = @"89989";
    NSString *s3 = @"33333";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
