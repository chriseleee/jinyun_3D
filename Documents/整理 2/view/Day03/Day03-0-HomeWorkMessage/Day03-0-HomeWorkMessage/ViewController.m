//
//  ViewController.m
//  Day03-0-HomeWorkMessage
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "MessageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MessageView *messageView;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _messageView.message = @"就撒了飞机撒旦了罚款家里撒风景了；萨芬了；撒地方就离开；开发萨芬是；拉法基科斯洛伐爱上飞洒来看积分撒地方萨拉克附近撒了；发动机大神";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
