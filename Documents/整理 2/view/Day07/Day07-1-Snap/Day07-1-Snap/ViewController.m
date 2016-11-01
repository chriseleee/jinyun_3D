//
//  ViewController.m
//  Day07-1-Snap
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *boxIV;
@property(nonatomic,strong) UIDynamicAnimator *annimator;
//闪烁行为
@property(nonatomic,strong) UISnapBehavior *snap;
@end
@implementation ViewController
- (UIDynamicAnimator *)annimator{
    if (!_annimator) {
        _annimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _annimator;
}

- (UIImageView *)boxIV{
    if (!_boxIV) {
        _boxIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        _boxIV.frame = CGRectMake(20, 20, 60, 60);
    }
    return _boxIV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.boxIV];
//添加一个点击手势，点哪里，箱子就闪烁到哪里
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGR];
}
- (void)tap:(UITapGestureRecognizer *)gr{
    CGPoint point = [gr locationInView:self.view];
//先移除原有的闪烁行为
    [self.annimator removeBehavior:self.snap];
//创建闪烁行为
    self.snap = [[UISnapBehavior alloc]initWithItem:self.boxIV snapToPoint:point];
    [self.annimator addBehavior:self.snap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
