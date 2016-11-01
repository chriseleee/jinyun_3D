//
//  ViewController.m
//  Day6-5-DynamicAttachment
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "BackGroudView.h"

@interface ViewController ()
@property(nonatomic,strong) UIDynamicAnimator *animator;
//吸附行为
@property(nonatomic,strong) UIAttachmentBehavior *attachment;
//重力行为
@property(nonatomic, strong) UIGravityBehavior *gravity;
@property(nonatomic, strong) UIImageView *imageView;
@end
@implementation ViewController
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        _imageView.frame = CGRectMake(0, 0, 80, 80);
    }
    return _imageView;
}
- (UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}
- (UIGravityBehavior *)gravity{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] initWithItems:nil];
    }
    return _gravity;
}
- (UIAttachmentBehavior *)attachment{
//吸附行为
    if (!_attachment) {
//吸附行为有两个参数，是初始化时必须传递的
//Anchor锚点
        _attachment = [[UIAttachmentBehavior alloc] initWithItem:self.imageView attachedToAnchor:CGPointMake(40, 40)];
    }
    return _attachment;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.attachment];
//吸附行为阻尼
    self.attachment.damping = 0.8;
//设定吸附行为的频率
    self.attachment.frequency = 0.8;
//通过一个拖动的手势，拖到哪里 就吸在哪里
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGR];
    
//监控吸附行为，画线
//由当前vc持有block对应的的那个对象的引用，block中如果使用self.方法， 这些对象需要是弱引用的， 否则会导致内存的循环引用行为。
    __weak UIAttachmentBehavior *weakAttachment = self.attachment;
    __weak UIImageView *weakImageView = self.imageView;
    __weak BackGroudView *weakBGView = (BackGroudView *)self.view;
    self.attachment.action = ^(){
//只要发生吸附行为 就会进入这个方法
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:weakAttachment.anchorPoint];
        [path addLineToPoint:weakImageView.center];
        path.lineWidth = 5;
        weakBGView.path = path;
        [weakBGView setNeedsDisplay];
    };
}
- (void)pan:(UIPanGestureRecognizer *)gr{
//随着拖动的位置，修改box的悬挂锚点
    CGPoint point = [gr locationInView:self.view];
    self.attachment.anchorPoint = point;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
