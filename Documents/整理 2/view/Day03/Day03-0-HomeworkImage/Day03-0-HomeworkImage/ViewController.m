//
//  ViewController.m
//  Day03-0-HomeworkImage
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIImageView *imageView;
@end
@implementation ViewController
//1.使用代码的方式向view中添加一个UIImageView对象,UIImageView的大小和加载的图片的大小一致,所以找一张大的图片
- (UIImageView *)imageView{
    if (!_imageView) {
//图片控件，如果使用initWithImage来初始化，那默认的大小就等于图片的大小
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Welcome"]];
//2)使用center属性将imageView移动到屏幕的中间
        _imageView.center = self.view.center;
//3)使用transform属性将imageView缩放到 屏幕刚刚好能显示下图片的全部
        [self configImageView];
//注意！ 通过代码生成的imageView 或者 是拖拽的imageView控件， 它们默认的userInterationEnable属性是NO， 即不接受用户操作, 那我们需要手动更改
        _imageView.userInteractionEnabled = YES;
        
    }
    return _imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
//4)对imageView 增加rotation手势,支持图片的旋转
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.imageView addGestureRecognizer:rotationGR];
//5)对imageView增加pinch手势,支持图片的缩放
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.imageView addGestureRecognizer:pinchGR];
//6)对imageView增加pan手势,支持图片的移动
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:panGR];
//7)对imageView增加tap手势,双击后,恢复到第3步
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tapGR];
}

- (void)configImageView{
    CGFloat xScale = self.view.bounds.size.width/_imageView.bounds.size.width;
    CGFloat yScale = self.view.bounds.size.height/_imageView.bounds.size.height;
    _imageView.transform = CGAffineTransformMakeScale(MIN(xScale, yScale), MIN(xScale, yScale));
}

- (void)tap:(UITapGestureRecognizer *)tap{
    self.imageView.transform = CGAffineTransformIdentity;
    [self configImageView];
}

- (void)pan:(UIPanGestureRecognizer *)gr{
    CGPoint translation = [gr translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, translation.x, translation.y);
    [gr setTranslation:CGPointZero inView:self.imageView];
}

- (void)pinch:(UIPinchGestureRecognizer *)gr{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, gr.scale, gr.scale);
    gr.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)gr{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, gr.rotation);
    gr.rotation = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
