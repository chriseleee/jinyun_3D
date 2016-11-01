//
//  ViewController.m
//  Demo0_Homework
//
//  Created by tarena on 15-6-23.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
/*
 2.作业:图片查看器
 1)使用代码的方式向view中添加一个UIImageView对象,UIImageView的大小和加载的图片的大小一致,所以找一张大的图片
 2)使用center属性将imageView移动到屏幕的中间
 3)使用transform属性将imageView缩放到 屏幕刚刚好能显示下图片的全部
 4)对imageView 增加rotation手势,支持图片的旋转
 5)对imageView增加pinch手势,支持图片的缩放
 6)对imageView增加pan手势,支持图片的移动
 7)对imageView增加tap手势,双击后,恢复到第3步
 */
@interface ViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pngImage"]];
    self.imageView = imageView;
    //设置初始状态
    [self loadImageView];
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;

    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [imageView addGestureRecognizer:panGR];
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinchGR.delegate = self;
    [imageView addGestureRecognizer: pinchGR];
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    rotationGR.delegate = self;
    [imageView addGestureRecognizer:rotationGR];

    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [imageView addGestureRecognizer:tapGR];
}

-(void)tap:(UITapGestureRecognizer *)gr{
    [self loadImageView];

}
-(void)loadImageView{
    // 设置中心点
    self.imageView.center = self.view.center;
    //  缩放,需要计算横向和纵向 缩小多少
    CGFloat xSale = self.view.bounds.size.width/self.imageView.bounds.size.width;
    CGFloat yScale = self.view.bounds.size.height/self.imageView.bounds.size.height;
    self.imageView.transform = CGAffineTransformMakeScale(MIN(xSale, yScale), MIN(xSale, yScale));
}

-(void)pan:(UIPanGestureRecognizer *)gr{
    // 方法一:改中心点
    // 读取的偏移的值 是从self.view坐标系下
    // 读取的,所以修改了center这个也属于self.view
    // 坐标系下的属性
//    CGPoint translation = [gr translationInView:self.view];
//    CGPoint center = self.imageView.center;
//    center.x += translation.x;
//    center.y += translation.y;
//    self.imageView.center = center;
//    [gr setTranslation:CGPointZero inView:self.view];

    //方法二:改transform实现位移
    //读取imageView坐标系下的偏移值
    //修改imageView坐标系下的属性值来实现位移
    CGPoint translation = [gr translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, translation.x, translation.y);
    [gr setTranslation:CGPointZero inView:self.imageView];
}

-(void)pinch:(UIPinchGestureRecognizer *)gr{
    CGFloat scale= gr.scale;
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
    gr.scale = 1;
}
-(void)rotation:(UIRotationGestureRecognizer *)gr{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, gr.rotation);
    gr.rotation = 0;
}






@end
