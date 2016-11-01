//
//  ViewController.m
//  Demo04-NSThread
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //方式一：
    [self createThreadByInit];
    
    //方式二：
//    [self createThreadByDetach];
    
    //方式三：
//    [self createThreadByPerform];
}

//方式三(了解:)
- (void)createThreadByPerform {
    //注意：NSObject的实例方法(self)
    [self performSelectorInBackground:@selector(downloadTask:) withObject:nil];
}

//方式二：
- (void)createThreadByDetach {
    //传递给selector参数
    //优势：自动会自动的创建一个线程，并自动的启动, 执行downloadTask
    //缺点：无法设定线程一些属性(名字/优先级)
    [NSThread detachNewThreadSelector:@selector(downloadTask:) toTarget:self withObject:@"parameter"];
}

//方式一:
- (void)createThreadByInit {
    //确定当前的代码执行在哪个线程
    NSLog(@"当前线程:%@", [NSThread currentThread]);
    
    //优势：在需要的时候启动该线程
    //object: 传递给selector方法的参数
    //1.创建了一个NSThread类型的对象
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadTask:) object:@"paramters"];
    //设定线程一些属性
    thread.name = @"子线程";//名字
    thread.threadPriority = 0.5;//优先级
    
    //2.执行线程的任务(downloadTask方法内部的逻辑)
    [thread start];
    
    NSLog(@"执行完毕");
}

- (void)downloadTask:(id)obj {
    //确定代码在哪个线程执行
    NSLog(@"当前线程：%@", [NSThread currentThread]);
    
    //模拟耗时操作
    for (int i = 0; i < 20; i++) {
        NSLog(@"当前循环次数：%d", i);
    }
}







@end
