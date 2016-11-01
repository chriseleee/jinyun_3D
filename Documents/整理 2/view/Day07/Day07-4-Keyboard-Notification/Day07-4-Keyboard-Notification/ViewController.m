//
//  ViewController.m
//  Day07-4-Keyboard-Notification
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//注册成为键盘 消失 和 出现 事件的观察者
//键盘出现，输入框上移，键盘消失，输入框归位
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//注册对键盘将要显示 事件的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
//注册对键盘将要消失 事件的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)closeKeyboard:(NSNotification *)notification{
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        CGRect frame = self.inputView.frame;
        frame.origin.y = self.view.bounds.size.height - frame.size.height;
//        self.inputView.frame = frame;
//关键盘，AutoLayout
        _verticalC.constant = 0;
    } completion:nil];
    [self.view layoutIfNeeded];
}
- (void)openKeyboard:(NSNotification *)notification{
    NSLog(@"keyboarInfo %@", notification.userInfo);
//获取键盘弹起后的frame, 转化为CGRect类型
    CGRect keyboarFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//获取键盘弹起时动画时长
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//获取键盘弹起时的动画选项
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
//计算输入框的新位置
    CGRect inputViewFrame = self.inputView.frame;
    inputViewFrame.origin.y = keyboarFrame.origin.y - inputViewFrame.size.height;
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
//        self.inputView.frame = inputViewFrame;
//使用AutoLayout，那么动画就要用约束来做
        _verticalC.constant = keyboarFrame.size.height;
    } completion:nil];
//如果是改变约束，要执行下方代码才好用
    [self.view layoutIfNeeded];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//取消对键盘的监听
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //点空白处 收起键盘
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
