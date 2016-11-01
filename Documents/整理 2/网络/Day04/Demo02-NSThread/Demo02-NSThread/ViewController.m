//
//  ViewController.m
//  Demo02-NSThread
//
//  Created by tarena on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
/**知识点：
 1. 如何创建NSThread线程 (第一和第二种方式)
 2. 知道类方法 [NSThread currentThread];
    ---> 明确代码在哪个线程中执行
 */

- (IBAction)createThreadByInit:(id)sender {
    NSLog(@"当前线程：%@", [NSThread currentThread]);
    
    //object: 传给downloadTask的参数
    //优点：创建和启动线程是分离 (在需要的时候在启动子线程/执行子线程的逻辑)
    //创建对象
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadTask) object:nil];
    //设置属性
    thread.name = @"线程一";
    //double：0.0~1.0 (值越高，优先级越大)
    thread.threadPriority = 0.5;
    
    //打印NSThread默认堆栈的大小
    NSLog(@"NSThread默认堆栈大小:%lu", (unsigned long)thread.stackSize);
    
    //启动子线程/执行子线程的任务
    [thread start];
}

//写子线程执行逻辑入口
- (void)downloadTask {
    //确定下面的代码在哪个线程执行
    NSLog(@"当前线程:%@", [NSThread currentThread]);
    
    //模拟耗时操作
    for (int i = 0; i < 20; i++) {
        NSLog(@"++++++++++++++");
        
        if (i == 2) {
            //线程退出(终止线程的继续执行)
            [NSThread exit];
        }
    }
    
}

//方式二：
- (IBAction)createThreadByDetach:(id)sender {
    //使用NSThread的一个类方法来创建子线程
    //withObject:传给downloadTask方法的参数
    /**
     优点：自动地创建线程；自动地启动线程；自动的执行downloadTask
     缺点：无法自定义线程名字/优先级/内存大小; 创建和启动是合二为一
     */
    [NSThread detachNewThreadSelector:@selector(downloadTask) toTarget:self withObject:nil];
    
}

//方式三：
- (IBAction)createThreadByPerform:(id)sender {
    /**使用NSObject的一个实例方法
       --> 创建并启动了一个后台线程(子线程)
       不推荐使用: iOS9之后过期
     */
    [self performSelectorInBackground:@selector(downloadTask) withObject:nil];
    
}










@end
