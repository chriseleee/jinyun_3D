//
//  ViewController.m
//  Day06-2-KeyAnimation
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"channel06"]];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:imageView];
//制作一个贝塞尔路径，圆圈形状
    UIBezierPath *path = [UIBezierPath bezierPath];
//圆心为屏幕中心，半径100像素，起始点3/4 pi，转一圈，顺时针
    [path addArcWithCenter:self.view.center radius:100 startAngle:3*M_PI_4 endAngle:3*M_PI_4 + 2*M_PI clockwise:YES];
//创建关键帧动画
//KeyPath代表动画类型，值是死记硬背的， position位置
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//设置圆圈路径为关键帧动画的移动路径
    moveAnimation.path = path.CGPath;
    //修改动画的时长, 要写在动画添加前，才好使
//    moveAnimation.duration = 3;
//修改动画执行的次数
//    moveAnimation.repeatCount = MAXFLOAT;
//添加动画
//key是唯一标识，用于多个动画的一个区分，这里用不上
    //[imageView.layer addAnimation:moveAnimation forKey:nil];

//添加缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//把C语言类型 转为OC对象类型
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)];
//    scaleAnimation.duration = 1;
//自动反向
//    scaleAnimation.autoreverses = YES;
//无限重复
//    scaleAnimation.repeatCount = MAXFLOAT;
    //[imageView.layer addAnimation:scaleAnimation forKey:nil];
//透明度动画
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
//    alphaAnimation.autoreverses = YES;
//    alphaAnimation.repeatCount = MAXFLOAT;
//    alphaAnimation.duration = 1;
    //[imageView.layer addAnimation:alphaAnimation forKey:nil];
    
//创建动画组，批量管理或添加动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[moveAnimation, scaleAnimation, alphaAnimation];
    group.autoreverses = YES;
    group.duration = 2;
//只执行一次，执行完毕之后，把图片删除掉
    group.repeatCount = 1;
//使用代理检测动画的执行状态
    group.delegate = self;
    [imageView.layer addAnimation:group forKey:nil];
    imageView.tag = 100;
}
//协议自动引入
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//动画结束，进入此代理，把图片移除掉
    UIImageView *imageview = (UIImageView *)[self.view viewWithTag:100];
    [imageview removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
