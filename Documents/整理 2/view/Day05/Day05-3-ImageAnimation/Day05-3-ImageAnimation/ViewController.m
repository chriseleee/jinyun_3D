//
//  ViewController.m
//  Day05-3-ImageAnimation
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#define FPS 30.0
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:imageView];
//这个方法，会自动的在imageName的后面 添加0 或者1， 一次类推的方式去寻找图片
//例如你输入图片名 image， 那么这个方法会自动寻找 图片名是image0, image1,image2......这样的图片，来构成动画
    UIImage *image = [UIImage animatedImageNamed:@"loading_" duration:6*1/FPS];
    imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
