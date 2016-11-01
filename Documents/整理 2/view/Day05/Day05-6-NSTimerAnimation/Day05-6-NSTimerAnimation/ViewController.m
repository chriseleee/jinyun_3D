//
//  ViewController.m
//  Day05-6-NSTimerAnimation
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIImageView *runIV;
@end
@implementation ViewController
- (UIImageView *)runIV{
    if (!_runIV) {
        _runIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 50, 50)];
        _runIV.image = [UIImage animatedImageNamed:@"loading_" duration:0.4];
    }
    return _runIV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.runIV];
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeLocation:) userInfo:nil repeats:YES];
}
- (void)changeLocation:(NSTimer *)timer{
//让小人从左匀速移动到屏幕右侧
    CGRect rect = self.runIV.frame;
    rect.origin.x += 1;
    self.runIV.frame = rect;
//当跑出屏幕外，让x轴回归
    if (rect.origin.x >= self.view.frame.size.width) {
//        -rect.size.width改0 试试哪个更好
        rect.origin.x = -rect.size.width;
        self.runIV.frame = rect;
    }
//让小人翻滚起来
//    self.runIV.transform = CGAffineTransformRotate(self.runIV.transform, M_PI_2);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
