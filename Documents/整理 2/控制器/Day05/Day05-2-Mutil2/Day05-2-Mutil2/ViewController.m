//
//  ViewController.m
//  Day05-2-Mutil2
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController
//重写button的getter方法
- (UIButton *)button{
//我们想要的是_button为空时，进if，空为假
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"跳转" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor whiteColor];
//这里只设置大小，位置由使用button的人来定。
        _button.frame = CGRectMake(0, 0, 100, 40);
        [_button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _button;
}

- (void)click{
    SecondViewController *secondVC = [SecondViewController new];
//modal模式跳转操作
//参数1:要跳转到的控制器对象
//参数2:是否动画显示
//参数3:跳转完成后的block回调，这里传nil
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
//  添加一个跳转按钮,使用懒加载
//因为是懒加载，所以一定要用self.button
    [self.view addSubview:self.button];
//改变按钮中心点的位置,把按钮放在self.view的中心
    self.button.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
