//
//  ViewController.m
//  Day13-3-Tabbar
//
//  Created by tarena on 15/8/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//使用故事板时，故事板会自动调用控制器的
//initWithCoder方法来完成控制器实例的创建
//死记硬背，苹果规定的
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"full_cart"];
    }
    return self;
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
