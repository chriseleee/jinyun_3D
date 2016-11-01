//
//  ViewController.m
//  Demo02-InvocationOperation
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
- (IBAction)invocationSync:(id)sender {
    //1. 创建一个NSInvocationOperation对象
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printPlus) object:nil];
    
    //3.同步执行操作operation
    [operation start];
    NSLog(@"执行完毕");
}
//2.写操作的逻辑
- (void)printPlus {
    for (int i = 0; i < 5; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"+++++++++%@",[NSThread currentThread]);
    }
}
- (void)printMinus {
    for (int i = 0; i<5; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"-------%@", [NSThread currentThread]);
    }
}
//异步执行
- (IBAction)invocationAsync:(id)sender {
    //1.创建两个操作
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printPlus) object:nil];
    NSInvocationOperation *secondOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(printMinus) object:nil];
    
    //2.创建非主队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //3.将上面的操作放到队列中 (添加的那一瞬间异步执行)
    [queue addOperation:operation];
    [queue addOperation:secondOperation];
    NSLog(@"执行完毕");
    
}






@end
