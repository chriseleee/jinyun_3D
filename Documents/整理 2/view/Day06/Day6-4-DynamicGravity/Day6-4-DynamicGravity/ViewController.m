//
//  ViewController.m
//  Day6-4-DynamicGravity
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>
//需要一个力学环境，把模拟器改造为真实的世界
@property(nonatomic, strong) UIDynamicAnimator *animator;
//重力属性，重力行为
@property(nonatomic, strong) UIGravityBehavior *gravity;
//碰撞行为
@property(nonatomic, strong) UICollisionBehavior *collision;
@end
@implementation ViewController
- (UICollisionBehavior *)collision{
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] initWithItems:nil];
//将力学体系的边缘变成可碰撞的四个边
        _collision.translatesReferenceBoundsIntoBoundary = YES;
//添加一条线，具有碰撞行为
//Identifier唯一标识，代理中使用
//        [_collision addBoundaryWithIdentifier:@"line1" fromPoint:CGPointMake(0, 100) toPoint:self.view.center];
//通过代理，来检测 碰撞行为的发生
        _collision.collisionDelegate = self;
    }
    return _collision;
}
//当碰撞行为发生时，触发下方代码
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    UIImageView *boxIV = (UIImageView *)item;
    boxIV.tintColor = [UIColor redColor];
//碰撞发生时，把箱子颜色改为红色
//重新渲染图片视图中的image
//imageWithRenderingMode 参数是枚举值，代表保持原状，使用渲染色 等等
    boxIV.image = [boxIV.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (UIDynamicAnimator *)animator{
    if (!_animator) {
//初始化方法，传入的参数将被改造为力学环境
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}
- (UIGravityBehavior *)gravity{
    if (!_gravity) {
//初始化传参，表示哪些控件拥有重力属性，这里先写nil
        _gravity = [[UIGravityBehavior alloc] initWithItems:nil];
//     重力强度
        _gravity.magnitude = 0.5;
//     重力方向
        _gravity.gravityDirection = CGVectorMake(0, 1);
    }
    return _gravity;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//使用图片生成背景色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
//把重力行为 添加到 力学环境中
    [self.animator addBehavior:self.gravity];
//把碰撞行为 添加到 力学环境中
    [self.animator addBehavior:self.collision];
    
//添加定时器，每半秒钟掉一个箱子
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(dropBox:) userInfo:nil repeats:YES];
}
- (void)dropBox:(NSTimer *)timer{
    //添加一个小箱子，让这个小箱子具有重力行为
    UIImageView *boxIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
//让箱子出现的x轴位置随机
    CGFloat x = arc4random()%(int)self.view.frame.size.width;
    boxIV.frame = CGRectMake(x, 0, 40, 40);
    
    [self.view addSubview:boxIV];
    //告诉箱子，你具有重力属性
    [self.gravity addItem:boxIV];
//告诉箱子 具有碰撞行为
    [self.collision addItem:boxIV];
    CGRect rect= CGRectZero;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
