//
//  ViewController.m
//  Day04-1-HomeWork
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UILabel *tipLb;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//点击登录按钮触发
- (IBAction)login:(id)sender {
    [self validLogin];
}
//判断用户名密码是否对，由登录按钮触发， 也可以由第二个文本框的done触发
- (void)validLogin{
    //收起键盘
    [self.view endEditing:YES];
    //    判断是否为空
    if (_nameTF.text.length == 0 || _pwdTF.text.length == 0) {
        _tipLb.text = @"用户名或密码不允许为空";
    }else{
        if ([_nameTF.text isEqualToString:@"didi"] && [_pwdTF.text isEqualToString:@"123456"]) {
            //            用户名密码正确
            _tipLb.text = @"登录成功";
        }else{
            //            用户名密码不正确
            _tipLb.text = @"用户名或密码错误";
        }
    }
}
//点击第一个文本框的Return按钮，触发Did End On Exit
- (IBAction)moveToNext:(id)sender {
//光标挪到第二个输入框，让第二个输入框变为第一响应者
    [_pwdTF becomeFirstResponder];
}
- (IBAction)finish:(UITextField *)sender {
//因为login:方法有收起键盘的代码，这里可以省略不写
//    [sender resignFirstResponder];
    
// 执行的任务等同于 登录按钮
//    [self login:nil];
    [self validLogin];
}
//点击屏幕空白处，隐藏键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
