//
//  ViewController.m
//  Demo01-MainThreadBlock-Pthread
//
//  Created by tarena on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}
//第一个按钮
- (IBAction)startTimingOperation:(id)sender {
    //耗时的操作
    for (int i = 0; i < 20000; i++) {
        NSLog(@"+++++++++++++++");
    }
}

//3.给定子线程执行逻辑的入口
/** void *(*)(void *)
 void: 无类型
 void *: 任意类型的指针
 */
void *task(void *data) {
    //耗时操作放到这里
    for (int i = 0; i < 2; i++) {
        NSLog(@"---------------");
    }
    return 0;
}

- (IBAction)startTimingOperationByPthread:(id)sender {
    
    //1.声明线程对象pthread
    pthread_t pthread;
    //2.设置线程属性
    //2.1 创建pthread对象
    /**
     第二个参数：pthread类型的属性; NULL:表示使用默认的pthread线程属性 (堆栈大小)
     第三个参数：传参void *, 返回类型是void *的函数 (子线程执行任务的入口)
     第四个参数：传给第三个参数对应的函数的传参(void *); NULL:不传参
     */
    int threadError = pthread_create(&pthread, NULL, task, NULL);
    if (threadError != 0) {
        NSLog(@"线程创建失败");
    }
    
    //打印pthread类型线程默认占用堆栈的内存大小 (512KB)
    size_t stackSize = pthread_get_stacksize_np(pthread);
    NSLog(@"pthread线程堆栈大小:%zu", stackSize);
    
    
    
}






@end
