//
//  ViewController.m
//  Day03-2-BoundsFrameCenterTransform
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (IBAction)changeFrame:(id)sender {
    CGRect frame = _imageView.frame;
    frame.origin.x += 4;
    frame.origin.y += 4;
    frame.size.width += 4;
    frame.size.height += 4;
    _imageView.frame = frame;
    [self printAttribute];
}
- (IBAction)changeBounds:(id)sender {
    CGRect bounds = _imageView.bounds;
    bounds.origin.x += 4;
    bounds.origin.y += 4;
    bounds.size.width += 4;
    bounds.size.height += 4;
    _imageView.bounds = bounds;
    [self printAttribute];
}
- (IBAction)changeCenter:(id)sender {
    CGPoint center = _imageView.center;
    center.x += 4;
    center.y += 4;
    _imageView.center = center;
    [self printAttribute];
}
- (IBAction)changeTransform:(id)sender {
    _imageView.transform = CGAffineTransformScale(_imageView.transform, 1.1, 1.1);
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, M_PI_4);
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, 4, 4);
    [self printAttribute];
}
- (void)printAttribute{
    NSLog(@"\nframe:%@\nbounds:%@\ncenter:%@\ntransform:%@", NSStringFromCGRect(_imageView.frame), NSStringFromCGRect(_imageView.bounds), NSStringFromCGPoint(_imageView.center), NSStringFromCGAffineTransform(_imageView.transform));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self printAttribute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
