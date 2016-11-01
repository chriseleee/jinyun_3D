//
//  ViewController.m
//  Day05-8-UIViewAnimation-Shine
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Welcome"]];
    imageView.frame = CGRectMake(10, 10, 40, 40);
    [self.view addSubview:imageView];
//闪烁动画:透明度反复 从0到1，再从1到0;
//delay 延迟，代表多长时间之后执行
//options 动画执行的效果，是个二进制的枚举类型
//UIViewAnimationOptionRepeat 重复动画
//UIViewAnimationOptionAutoreverse 反向动画
//UIViewAnimationOptionCurveEaseIn 动画由慢到快
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseIn animations:^{
//        imageView.alpha = 0;
//让图片旋转
        imageView.transform = CGAffineTransformMakeRotation(M_PI);
//让图片移动到中心点
        imageView.center = self.view.center;
    } completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
