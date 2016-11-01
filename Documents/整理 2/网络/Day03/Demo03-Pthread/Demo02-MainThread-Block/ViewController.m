//
//  ViewController.m
//  Demo02-MainThread-Block
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startTimingOperation:(id)sender {
    
    //模拟耗时的操作(主线程中执行)
    for (int i = 0; i < 30000; i++) {
        NSLog(@"当前运行次数:%d", i);
    }
}

//void *(*)(void *)
//task：函数名字
//data: 函数的形参名字
//void *: 任意类型的指针
void *task (void *data) {
    
    //模拟耗时的操作(pthread类型的子线程中执行)
    for (int i = 0; i < 30000; i++) {
        NSLog(@"当前运行次数:%d", i);
    }
    
    return 0;
}

- (IBAction)startTimeOperationByPthread:(id)sender {
//    //2.创建子线程对象pthread_t
//    pthread_t thread;
//    
//    //3.创建子线程，并执行任务(耗时操作)
//    /**
//     第二个参数：使用系统默认的属性创建线程
//     第三个参数：函数指针(把耗时操作执行函数)
//     第四个参数：传给第三个参数对应函数的参数
//     */
//    int pthreadError = pthread_create(&thread, NULL, task, NULL);
//    
//    if (pthreadError != 0) {
//        NSLog(@"创建pthread类型的子线程失败!!!");
//    }
    pthread_t thread;
    pthread_create(&thread, NULL, task, NULL);
}





@end
