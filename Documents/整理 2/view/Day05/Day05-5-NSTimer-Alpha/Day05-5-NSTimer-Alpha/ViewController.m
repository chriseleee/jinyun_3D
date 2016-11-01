//
//  ViewController.m
//  Day05-5-NSTimer-Alpha
//
//  Created by tarena on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIImageView *imageView;
@end
@implementation ViewController
{
    BOOL _show; //真 代表淡入显示，假 淡出消失
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Welcome"]];
//初始化让图片变透明, alpha取值范围是0~1， 0为透明 1不透明
        _imageView.alpha = 0;
        _show = YES;
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.frame = CGRectMake(10, 10, 200, 300);
    [self.view addSubview:self.imageView];
//2秒时间，把图片从透明变为不透明
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeAlpha:) userInfo:nil repeats:YES];
}
- (void)changeAlpha:(NSTimer *)timer{
//闪烁效果
    if (_show) {
        self.imageView.alpha += 0.01;
//当图片完全显示出来，就应该转为消失状态
        if (self.imageView.alpha >= 1) {
            _show = NO;
        }
    }else{
        self.imageView.alpha -= 0.01;
        if (self.imageView.alpha <= 0) {
            _show = YES;
        }
    }
    /*
//每0.02秒，修改一次alpha的值， 在2秒钟之内从0加到1
    self.imageView.alpha += 0.002;
//当alpha值大于等于1时， 关闭定时器
    if (self.imageView.alpha >= 1) {
        [timer invalidate];
        NSLog(@"定时器关闭");
    }
     */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
