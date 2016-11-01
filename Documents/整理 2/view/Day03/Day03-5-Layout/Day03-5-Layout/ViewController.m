//
//  ViewController.m
//  Day03-5-Layout
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@end
@implementation ViewController
//监控界面的变化,需要重写方法
//- (void)viewWillLayoutSubviews{
//    
//}
- (void)viewDidLayoutSubviews{
//按钮一，右上角 离上边缘20，离右边缘20， 宽度100， 高度40
    CGRect rect1;
    CGPoint point1 = CGPointMake(self.view.bounds.size.width - 20 - 100, 20);
    CGSize size1 = CGSizeMake(100, 40);
    rect1.origin = point1;
    rect1.size = size1;
    _btn0.frame = rect1;
    
    CGRect rect2;
    CGPoint point2 = CGPointMake(self.view.bounds.size.width - 100 - 20, self.view.bounds.size.height - 20 - 40);
    CGSize size2 = CGSizeMake(100, 40);
    rect2.origin = point2;
    rect2.size = size2;
    _btn1.frame = rect2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
