//
//  ViewController.m
//  Day02-11-TransformGS
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Pinch:(UIPinchGestureRecognizer *)sender {
//通过捏合操作放大或者缩小图片
    CGFloat scale = sender.scale;
    _imageView.transform = CGAffineTransformScale(_imageView.transform, scale, scale);
//每次的倍数变换之后，都需要重置当前倍数
    sender.scale = 1;
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint transform = [sender translationInView:self.view];
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, transform.x, transform.y);
    [sender setTranslation:CGPointZero inView:self.view];
}
- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
//取得弧度值
    CGFloat angle = sender.rotation;
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, angle);
//重置弧度值
    sender.rotation = 0;
}
//同时允许放大和旋转操作
//下方代理 询问是否允许同时记录多个手势操作, 返回YES即允许
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
