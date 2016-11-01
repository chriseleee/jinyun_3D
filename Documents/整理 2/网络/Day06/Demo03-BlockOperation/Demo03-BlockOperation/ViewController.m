//
//  ViewController.m
//  Demo03-BlockOperation
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)blockSync:(id)sender {
    //1.创建NSBlockOperation操作
    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
    
    //2.添加操作
    [operation addExecutionBlock:^{
        NSLog(@"下载图片一%@", [NSThread currentThread]);
    }];
    
    [operation addExecutionBlock:^{
        NSLog(@"下载图片二%@", [NSThread currentThread]);
    }];
    
    [operation addExecutionBlock:^{
        NSLog(@"下载图片三%@", [NSThread currentThread]);
    }];
    
    //3.开始执行 (同步执行)
    [operation start];
    NSLog(@"执行完毕");
    
}

- (IBAction)blockAsync:(id)sender {
    //1.创建NSBlockOperation操作
    NSBlockOperation *firstOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片一%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *secondOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片二%@", [NSThread currentThread]);
    }];
    
    //2.创建一个非主队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //3.将创建的操作添加到队列中 (就开始异步执行)
    [queue addOperation:firstOperation];
    [queue addOperation:secondOperation];
    NSLog(@"执行完毕");
    
}






@end
