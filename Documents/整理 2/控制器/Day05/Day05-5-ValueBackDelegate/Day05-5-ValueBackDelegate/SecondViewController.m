//
//  SecondViewController.m
//  Day05-5-ValueBackDelegate
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *tf;

@end

@implementation SecondViewController

- (UITextField *)tf{
    if (!_tf) {
        _tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        _tf.placeholder = @"Please Input Message";
        _tf.returnKeyType = UIReturnKeyDone;
        [_tf addTarget:self action:@selector(back) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _tf;
}
- (void)back{
//_delegate就是A界面的对象指针
    [_delegate viewController:self didFinishInputWithMessage:_tf.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tf];
    self.tf.center = CGPointMake(150, 70);
    self.view.backgroundColor = [UIColor purpleColor];
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
