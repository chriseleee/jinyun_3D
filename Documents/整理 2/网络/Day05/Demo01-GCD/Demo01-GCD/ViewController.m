//
//  ViewController.m
//  Demo01-GCD
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
- (IBAction)serialSync:(id)sender {
    NSLog(@"串行队列同步执行");
    //1.创建空的串行队列
    dispatch_queue_t queue = dispatch_queue_create("SerialQueue", DISPATCH_QUEUE_SERIAL);
    //2.创建任务并放到队列中
    //3.执行任务
    dispatch_sync(queue, ^{
        //写任务逻辑
        for (int i = 0; i < 10; i++) {
            //让线程sleep一秒钟
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++++++%@", [NSThread currentThread]);
        }
    });
    NSLog(@"打印第一个完毕");
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; i++) {
            //让线程sleep一秒钟
            [NSThread sleepForTimeInterval:1];
            NSLog(@"---------------%@", [NSThread currentThread]);
        }
    });
    NSLog(@"打印第二个完毕");
    
}

- (IBAction)serialAsync:(id)sender {
    NSLog(@"串行队列异步执行");
    dispatch_queue_t queue = dispatch_queue_create("SecondSerialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++:%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        for (int i = 0; i < 10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"-----------:%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
    
}
//基本用不到
- (IBAction)concurrentSync:(id)sender {
    NSLog(@"并行队列同步执行");
    dispatch_queue_t queue = dispatch_queue_create("ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"+++++++++++++%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"-------------%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}

- (IBAction)concurrentAsync:(id)sender {
    NSLog(@"并行队列异步执行");
    dispatch_queue_t queue = dispatch_queue_create("SecondConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"++++++++++++%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第一个打印完毕");
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"------------%@", [NSThread currentThread]);
        }
    });
    NSLog(@"第二个打印完毕");
}








@end
