//
//  ViewController.m
//  Demo0_Homework
//
//  Created by tarena on 15-6-19.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRMessageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TRMessageView *messageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messageView.message = @"这是测试字符串长点看看能不能换个航什么的这是测试字符串长点看看能不能换个航什么的";
}



@end
