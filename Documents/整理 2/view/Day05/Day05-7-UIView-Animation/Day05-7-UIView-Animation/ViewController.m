//
//  ViewController.m
//  Day05-7-UIView-Animation
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UILabel *helloLb;
@end
@implementation ViewController
- (UILabel *)helloLb{
    if (!_helloLb) {
        _helloLb = [[UILabel alloc] initWithFrame:CGRectMake(-100, 60, 100, 23)];
        _helloLb.font = [UIFont systemFontOfSize:30];
        _helloLb.text = @"Hello";
        _helloLb.textAlignment = NSTextAlignmentCenter;
//        _helloLb.backgroundColor = [UIColor clearColor];
    }
    return _helloLb;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.helloLb];
//左上角 红色小方块，移动到屏幕中心
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
//UIView提供的动画类方法
//Duration 动画执行的时长
    [UIView animateWithDuration:2 animations:^{
//block内部，填写执行动画的控件的最终值
        CGPoint center = self.helloLb.center;
        center.x = self.view.center.x;
        self.helloLb.center = center;
        
        v.center = self.view.center;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
