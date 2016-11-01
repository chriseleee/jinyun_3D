//
//  ViewController.m
//  Day02-10-Transform
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ViewController
//位移
- (IBAction)translation:(id)sender {
//tx是x轴位移， ty是y轴位移
    
//使用带有Make的方法，只会移动一次50，50
//    self.imageView.transform = CGAffineTransformMakeTranslation(50, 50);
//使用不带有make的方法，每次点击都会移动
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 50, 50);
}
//缩放
- (IBAction)scale:(id)sender {
//sx x轴放大倍数, sy y轴的放大倍数
//    self.imageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.5, 1.5);
}
//旋转
- (IBAction)rotation:(id)sender {
//    self.imageView.transform = CGAffineTransformMakeRotation(M_PI_4);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
}
//还原
- (IBAction)identity:(id)sender {
    self.imageView.transform = CGAffineTransformIdentity;
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
