//
//  ViewController.m
//  Day07-2-Push
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) UIDynamicAnimator *animator;
//推力行为
@property(nonatomic,strong) UIPushBehavior *pushBehavior;
@property(nonatomic,strong) UICollisionBehavior *collisionBehavior;
@end
@implementation ViewController
- (UICollisionBehavior *)collisionBehavior{
    if (!_collisionBehavior) {
        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.imageView]];
    }
    return _collisionBehavior;
}

- (UIPushBehavior *)pushBehavior{
    if (!_pushBehavior) {
//mode 枚举值， 两个， 瞬时 和 持续。
//continuous 是持续
        _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.imageView] mode:UIPushBehaviorModeContinuous];
    }
    return _pushBehavior;
}
- (UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    CGPoint center = self.imageView.center;
//算力的角度
//反正切函数
    CGFloat angle = atan2(point.y - center.y, point.x - center.x);
//改拉 为 推， 加pi
    self.pushBehavior.angle = angle + M_PI;
//算推力大小
//数学函数
//powf(x,y)  用于计算x的y次幂
//sqrt(x) 用于计算x的平方根
    CGFloat distance = sqrt(powf(point.x - center.x, 2) + powf(point.y - center.y, 2));
    self.pushBehavior.magnitude = distance/100;
//激活推力行为
    self.pushBehavior.active = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//添加推力行为
    [self.animator addBehavior:self.pushBehavior];
    [self.animator addBehavior:self.collisionBehavior];
//让力学环境的4个边缘是可碰撞的
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
