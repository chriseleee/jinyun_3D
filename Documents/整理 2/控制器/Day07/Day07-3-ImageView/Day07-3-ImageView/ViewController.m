//
//  ViewController.m
//  Day07-3-ImageView
//
//  Created by tarena on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cardback"]];
    imageView.frame = CGRectMake(10, 10, 100,200);
    [self.view addSubview:imageView];
//设置图片控件的显示模式
    imageView.contentMode = UIViewContentModeCenter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
