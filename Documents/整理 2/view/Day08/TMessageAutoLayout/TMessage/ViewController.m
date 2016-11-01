//
//  ViewController.m
//  TMessage
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRMessageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *messages;
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableVConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation ViewController
- (NSArray *)messages{
    if (!_messages) {
        _messages = [TRMessage demoData];
    }
    return _messages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//注册自定义的cell
    [_tableView registerClass:[TRMessageCell class] forCellReuseIdentifier:@"MyCell"];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    TRMessage *m = self.messages[indexPath.row];
    cell.message = m;
    return cell;
}
//通过代理，修改每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//找到indexpath对应的cell。取cell得bounds 的高度
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)closeKeyboard:(NSNotification *)notificaton{
    NSTimeInterval duration = [notificaton.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions option = [notificaton.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        _verticalConstraint.constant = 0;
    } completion:nil];
    [self.view layoutIfNeeded];
}
- (void)openKeyboard:(NSNotification *)notification{
//获取键盘的高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//获取键盘的动画时间
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//获取键盘的动画效果
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
//添加一个动画，让输入区域向上移动，正好超出键盘的范围,目的是防止键盘弹出以后，遮盖了输入框
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        _verticalConstraint.constant = keyboardFrame.size.height;
    } completion:nil];
//要想出现动画效果，更改约束以后要执行下方语句
    [self.view layoutIfNeeded];
//让table滚动到最后一行
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messages.count -1 inSection:0];
    [_tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
//检测手指的拖拽操作，只要拖拽了，就隐藏键盘
//那我想点击就隐藏键盘， 需要给tableView加tap手势
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

////点击空白区域 收起键盘
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
//}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//由didEndOnExit方法触发
- (IBAction)sendMessage:(UITextField *)sender {
//当输入框内容不为空时，发送消息
    if (sender.text.length > 0) {
        TRMessage *m = [TRMessage new];
        m.content = sender.text;
        m.fromMe = YES;
//如何向不可变数组中加数据
        NSMutableArray *arr = [NSMutableArray arrayWithArray:self.messages];
        [arr addObject:m];
        self.messages = arr;
//发送内容以后，要清空输入框
        sender.text = @"";
//更新表格
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.messages.count - 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:5];
//        [_tableView scrollToRowAtIndexPath:newIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}





@end
