//
//  ViewController.m
//  Demo01-BlockOperation-Special
//
//  Created by tarena on 15/9/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)setMaxThreadCount:(id)sender {
    //1.创建操作(NSBlockOperation)
    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片一完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片二完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片三完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *fourthOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片四完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *fifthOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片五完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *sixthOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片六完成%@", [NSThread currentThread]);
    }];
    NSBlockOperation *seventhOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片七完成%@", [NSThread currentThread]);
    }];
    
    //2.创建非主队列
    //2.1设定最大启动线程数
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //3~5
    queue.maxConcurrentOperationCount = 3;
    
    //3.创建的操作放到非主队列中(开始异步执行)
    [queue addOperation:firstOperation];
    [queue addOperation:secondOperation];
    [queue addOperation:thirdOperation];
    [queue addOperation:fourthOperation];
    [queue addOperation:fifthOperation];
    [queue addOperation:sixthOperation];
    [queue addOperation:seventhOperation];
    
    NSLog(@"下载完毕");
    
    
}
- (IBAction)setTaskDependency:(id)sender {
    //task1+task2 ---> task3
    /**
     task3依赖task1
     task3依赖task2
     */
    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片一%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
    }];
    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片二:%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:4];
    }];
    NSBlockOperation *thirdOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片三%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    }];
    
    //创建非主队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //设置任务之间的依赖关系
    //task3依赖task1
    [thirdOperation addDependency:firstOperation];
    //task3依赖task2
    [thirdOperation addDependency:secondOperation];
    
    //task1+task2  ---> task3
    [queue addOperation:firstOperation];
    [queue addOperation:secondOperation];
    [queue addOperation:thirdOperation];
    
    //回到主线程
    [self returnMainThreadByOperation];
}

- (void)returnMainThreadByOperation {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"11111111开始下载图片%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        
        //回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //主线程中
            NSLog(@"111111更新UI界面%@", [NSThread currentThread]);
        }];
    }];
}










@end
