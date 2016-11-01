//
//  SecondViewController.m
//  Day05-2-Mutil2
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation SecondViewController

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:40];
        _backBtn.frame = CGRectMake(0, 0, 100, 40);
        [_backBtn setBackgroundColor:[UIColor whiteColor]];
        [_backBtn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)clickBack{
//    返回上一页
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//非xib或storyboard新建的视图控制器，self.view默认是透明的
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.backBtn];
//让按钮中心点在 200，200 这个位置
    self.backBtn.center = CGPointMake(200, 200);
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
