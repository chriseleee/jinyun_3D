//
//  ViewController.m
//  Day03-1-Bounds
//
//  Created by tarena on 15/8/21.
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
- (IBAction)changeBounds:(id)sender {
//每次点击，bounds的y轴+ 5
//xxxx  self.view.bounds.origin.y += 5;
    CGRect bounds = self.view.bounds;
    bounds.origin.y += 5;
    self.view.bounds = bounds;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
