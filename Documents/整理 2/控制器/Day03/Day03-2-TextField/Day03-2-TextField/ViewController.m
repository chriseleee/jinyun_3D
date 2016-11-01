//
//  ViewController.m
//  Day03-2-TextField
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showKeyboard:(id)sender {
//让文本框变为第一响应者
    [_textfield becomeFirstResponder];
}

- (IBAction)hideKeyboard:(id)sender {
//让文本框失去第一响应者状态
//resign注销 first第一 responder响应者
    [_textfield resignFirstResponder];
}
//由文本框链接生成，选择Did End On Exit事件，表示是点击键盘右下角return按钮触发的操作
- (IBAction)hideKeyboardReturn:(id)sender {
    [_textfield resignFirstResponder];
}

//点击了控制器的基础视图,会自动触发下面方法(touchesBegan)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    endEditing 表示对view中的有所输入框发送 取消第一响应者消息
//    YES代表强制取消，NO代表非强制取消。习惯上写YES
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
