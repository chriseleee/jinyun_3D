//
//  SecondViewController.m
//  Day06-4-Navi-Code
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(30, 100, 80, 40);
}
- (void)click{//返回上一页
    [self.navigationController popViewControllerAnimated:YES];
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
