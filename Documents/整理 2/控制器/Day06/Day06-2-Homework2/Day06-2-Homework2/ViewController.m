//
//  ViewController.m
//  Day06-2-Homework2
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
//4
@interface ViewController ()<SecondViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//如果是storyboar中，连线方式进行跳转操作，会自动触发下面的方法
//segue对象有以下两个重要属性
//sourceViewController  源视图控制器
//destinationViewController 目标视图控制器
//比如A跳转到B， A就是源， B就是目标
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController *vc = segue.destinationViewController;
//可以添加4种翻页动画，自己试试吧
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    vc.delegate = self;
}
//6
- (void)makeTFWithRect:(CGRect)rect content:(NSString *)content{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.text = content;
    [self.view addSubview:label];
}

@end


