//
//  ViewController.m
//  Day03-6-MoreLayout
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@end
@implementation ViewController
- (void)viewDidLayoutSubviews{
//左边缘20，右边缘20，中间间隔10
    CGFloat buttonWidth = (self.view.bounds.size.width - 20 - 20 - 10)/2;
    CGRect frame = CGRectMake(20, 20, buttonWidth, 40);
    _button1.frame = frame;
    
    frame.origin.x += (10+buttonWidth);
    _button2.frame = frame;
//图片定义 离上边缘70像素，下边缘50像素
//frame 是值传递属性，不会因为更改frame导致之前的赋值也发生更改
    frame.size = CGSizeMake(self.view.frame.size.width - 20 -20, self.view.bounds.size.height - 70 - 50);
    frame.origin = CGPointMake(20, 70);
    _imageView.frame = frame;
//-20 - 20  减屏幕边缘距离， 减按钮宽度 或者 高度
    frame.size = CGSizeMake(20, 20);
    frame.origin = CGPointMake(self.view.bounds.size.width - 20 - 20, self.view.bounds.size.height - 20 - 20);
    _b3.frame = frame;
    
    frame.origin.x -= (10 + 20);
    _b2.frame = frame;
    
    frame.origin.x -= (10 + 20);
    _b1.frame = frame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIButton appearance] setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
