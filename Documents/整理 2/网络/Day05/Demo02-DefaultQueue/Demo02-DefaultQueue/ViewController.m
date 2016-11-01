//
//  ViewController.m
//  Demo02-DefaultQueue
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)globalAsync:(id)sender {
    //1.获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //2.将任务添加到全局队列中
    //3.异步执行全局队列中的任务
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++");
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"---------");
        }
    });
    NSLog(@"第二个打印完毕");
}

//基本不太用
- (IBAction)mainAsync:(id)sender {
    NSLog(@"主队列异步发送");
    //获取系统创建好的主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(mainQueue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++++++%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    
    dispatch_async(mainQueue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"-----------%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}


//互相等待的状态 ---> 任何主队列的任务都无法完成
- (IBAction)mainSync:(id)sender {
    NSLog(@"主队列同步发送");
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第一个执行完毕");
}








@end
