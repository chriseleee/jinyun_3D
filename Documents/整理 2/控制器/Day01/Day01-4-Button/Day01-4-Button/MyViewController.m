//
//  MyViewController.m
//  Day01-4-Button
//
//  Created by tarena on 15/7/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    按钮  UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 40, 40);
//    把按钮添加到默认视图上
    [self.view addSubview:btn];
/*
 UIControlStateNormal  正常状态
 UIControlStateHighlighted 高亮状态
 UIControlStateDisabled  不可用状态
 UIControlStateSelected  被选择状态
 */
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitle:@"好疼" forState:UIControlStateHighlighted];
//    给btn添加一个点击事件
//    当event被触发时，将会执行target对象中的action方法
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
//当按钮点击时，执行的方法
- (void)click{
    NSLog(@"按钮被点击了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
