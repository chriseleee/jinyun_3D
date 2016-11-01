//
//  SecondViewController.m
//  Day05-3-PassValue
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UILabel *lb;
@end

@implementation SecondViewController
- (UILabel *)lb{
    if (!_lb) {
        _lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _lb.backgroundColor = [UIColor grayColor];
    }
    return _lb;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.lb];
    self.lb.center = CGPointMake(120, 60);
    self.view.backgroundColor = [UIColor orangeColor];
//    显示接收到的消息
    _lb.text = _message;
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
