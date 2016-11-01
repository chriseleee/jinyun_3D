//
//  MyViewController.m
//  Day02-1-HomeWork
//
//  Created by tarena on 15/7/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
{
//这个变量指向当前的最新添加的Label
    UILabel *_currentLabel;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//添加按钮，功能是每次点击添加一个Label
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 30, 100, 30);
    btn.backgroundColor = [UIColor lightGrayColor];
//    通过|或者&间隔枚举值，同时设置按钮的4种不同状态，都是Add这个题目
//    [btn setTitle:@"Add" forState:UIControlStateNormal&UIControlStateHighlighted&UIControlStateDisabled&UIControlStateSelected];
    [btn setTitle:@"Add" forState:UIControlStateNormal];
//添加事件, self就代表当前的.m文件
    [btn addTarget:self action:@selector(addLabel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
//.h声明，则是公有的，其他类也可以调用。
//.m直接写实现的，则为私有。只有self能调用.
- (void)addLabel:(UIButton *)sender{
    NSLog(@"点击按钮");
    double y = _currentLabel?_currentLabel.frame.origin.y + _currentLabel.frame.size.height + 10 : 70;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, y, 280, 20)];
//判断_current是否为空，空则为假，表明是第一次添加label，那么label的内容应该是Hello。 如果非空，那么就在之前label文字的基础上 添加一个 word字符串。
    label.text = _currentLabel? [_currentLabel.text stringByAppendingString:@"Word"]:@"Hello";
    [self.view addSubview:label];
//    指针指向最新添加的Label
    _currentLabel = label;
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
