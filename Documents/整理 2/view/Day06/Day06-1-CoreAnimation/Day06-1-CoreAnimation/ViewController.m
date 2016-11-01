//
//  ViewController.m
//  Day06-1-CoreAnimation
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
    self.view.backgroundColor = [UIColor orangeColor];
//    cornerRadius 4个角的弧度
    self.view.layer.cornerRadius = 10;
//使用layer属性，修改图片的各种渲染效果
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60, 150, 150)];
    imageView.image = [UIImage imageNamed:@"channel04"];
    [self.view addSubview:imageView];
//把图片改为圆角的
//如果要把正方形图片改为圆形，传值为图片的宽度的一半
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
//注意:要把图片变圆角，需要打开边缘属性
    imageView.layer.masksToBounds = YES;
//为图片添加描边
//描边颜色
    imageView.layer.borderColor = [UIColor greenColor].CGColor;
//描边宽度
    imageView.layer.borderWidth = 5;
//手动创建一个有内容的layer，并显示
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    layer.frame = CGRectMake(40, 220, 200, 100);
    [self.view.layer addSublayer:layer];
//为layer添加阴影
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowRadius = 10;
    layer.shadowOpacity = 1; //透明度
//创建带有图片的层
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (id)[UIImage imageNamed:@"channel04"].CGImage;
    imageLayer.frame = CGRectMake(40, 330, 80, 80);
    [self.view.layer addSublayer:imageLayer];
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = 10;
//创建带有文字的层
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.string = @"Hello";
    textLayer.foregroundColor = [UIColor blackColor].CGColor; //文字颜色
    textLayer.frame = CGRectMake(140, 340, 200, 70);
    [self.view.layer addSublayer:textLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

