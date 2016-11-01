//
//  EyeViewController.m
//  Day08-1-HomeWork
//
//  Created by tarena on 15/8/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "EyeViewController.h"

@interface EyeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation EyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//设置导航栏的题目
//self.navigationItem.title = ...
    self.title = [NSString stringWithFormat:@"%.0f", self.fontSize];
//设置E的大小
    _label.font = [UIFont systemFontOfSize:_fontSize];
    
}
//看不清,返回上一页
- (IBAction)cannotSee:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//看得清,进入新的页面，并且缩小文字
- (IBAction)canSee:(id)sender {
    EyeViewController *eyeVC = [EyeViewController new];
//将要跳转页面的字体大小比当前页面的小10
    eyeVC.fontSize = _fontSize - 10;
    [self.navigationController pushViewController:eyeVC animated:YES];
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
