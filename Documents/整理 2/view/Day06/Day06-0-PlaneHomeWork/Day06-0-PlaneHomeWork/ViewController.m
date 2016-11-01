//
//  ViewController.m
//  Day06-0-PlaneHomeWork
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *planeIV;
@end
@implementation ViewController
- (UIImageView *)planeIV{
    if (!_planeIV) {
        _planeIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Aircraft"]];
        _planeIV.frame = CGRectMake(0, 0, 60, 60);
//因为图片宽高比例不是1:1，为了显示正常比例的图片，改变显示模式
        _planeIV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _planeIV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.planeIV];
    self.planeIV.center = self.view.center;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGR];
}
- (void)tap:(UITapGestureRecognizer *)gr{
    CGPoint point = [gr locationInView:self.view];
    [UIView animateWithDuration:2 animations:^{
        self.planeIV.center = point;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
