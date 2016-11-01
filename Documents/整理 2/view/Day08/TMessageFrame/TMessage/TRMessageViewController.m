//
//  TRMessageViewController.m
//  TMessage
//
//  Created by tarena on 15-6-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "TRMessageViewController.h"
#import "TRMessage.h"
#import "TRMessageCell.h"

@interface TRMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *allMessages;
@property (weak, nonatomic) IBOutlet UIView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TRMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allMessages = [[TRMessage demoData] mutableCopy];
    //注册单元格
    [self.tableView registerClass:[TRMessageCell class] forCellReuseIdentifier:@"MyCell"];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allMessages.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    cell.message = self.allMessages[indexPath.row];
    return cell;
}
//设定每行的行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //找到indexPath对应的cell,返回cell的bounds中的height
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

//在视图即将显示时,添加对键盘通知的监听
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

//当视图即将消失时,移除对键盘通知的监听
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

//视图显示完毕后,滚动到表格的最后一行
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.allMessages.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


//键盘弹起时执行该方法
//1.修改inputTextView的位置到键盘之上
-(void)openKeyboard:(NSNotification *)notification{
    CGRect frameOfKeyboard = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect frameOfInputTextView = self.inputTextView.frame;
    frameOfInputTextView.origin.y = frameOfKeyboard.origin.y-frameOfInputTextView.size.height;
    //计算表格这个滚动视图应该偏移的距离
    CGPoint offset = self.tableView.contentOffset;
    offset.y += frameOfKeyboard.size.height;
    //设定表视图的底部内边距为键盘的高
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, frameOfKeyboard.size.height, 0);

    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.inputTextView.frame = frameOfInputTextView;
        self.tableView.contentOffset = offset;
    } completion:nil];
}

//收起键盘时,inputTextView回到屏幕底部
-(void)closeKeyboard:(NSNotification *)notification{
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect frameOfInputTextView = self.inputTextView.frame;
    frameOfInputTextView.origin.y = self.view.bounds.size.height-frameOfInputTextView.size.height;

    //设置表视图滚动回最后一行的位置
    NSIndexPath *lastIndexPh = [NSIndexPath indexPathForRow:self.allMessages.count-1 inSection:0];
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        self.inputTextView.frame = frameOfInputTextView;
        [self.tableView scrollToRowAtIndexPath:lastIndexPh atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    } completion:nil];
}
//点击键盘右下角按键时,收起键盘
//并发送消息
- (IBAction)sendMessage:(UITextField *)sender {
    if(self.textField.text.length>0){
        //创建message对象
        TRMessage *newMessage = [[TRMessage alloc]init];
        newMessage.content = self.textField.text;
        newMessage.fromMe = YES;
        //清空文本框
        self.textField.text = @"";
        //添加到self.allMessages中
        [self.allMessages addObject:newMessage];
        //更新表格
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.allMessages.count-1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationBottom];

    }
}

@end



