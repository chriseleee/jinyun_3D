//
//  ViewController.m
//  Day06-3-RotationAnimation
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ViewController
- (IBAction)rotationX:(id)sender {
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//图片绕x轴旋转pi角度
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 1.0, 0, 0)];
    transformAnimation.duration = 3;
    [self.imageView.layer addAnimation:transformAnimation forKey:nil];
}
- (IBAction)rotationY:(id)sender {
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //图片绕y轴旋转pi角度
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 0, 1, 0)];
    transformAnimation.duration = 3;
    [self.imageView.layer addAnimation:transformAnimation forKey:nil];
}
- (IBAction)rotationZ:(id)sender {
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //图片绕z轴旋转pi角度
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 0, 0, 1)];
    transformAnimation.duration = 3;
    [self.imageView.layer addAnimation:transformAnimation forKey:nil];
}
- (IBAction)rotationAll:(id)sender {
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //图片绕x.y.z轴旋转pi角度
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:self.imageView.layer.transform];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.imageView.layer.transform, M_PI, 1.0, 1, 1)];
    transformAnimation.duration = 3;
    transformAnimation.repeatCount = MAXFLOAT;
    transformAnimation.autoreverses = YES;
    [self.imageView.layer addAnimation:transformAnimation forKey:nil];
}








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
