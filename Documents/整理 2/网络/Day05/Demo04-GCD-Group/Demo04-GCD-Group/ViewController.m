//
//  ViewController.m
//  Demo04-GCD-Group
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
    
    //队列：全局队列
    //执行方式：dispatch_group_async()
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();
    //把耗时的下载的图片的任务加到全局队列中，以group为单位
    dispatch_group_async(group, globalQueue, ^{
        [NSThread sleepForTimeInterval:4];
        NSLog(@"第一个图片下载完毕:%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, globalQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"第二个图片下载完毕:%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, globalQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"第三个图片下载完毕:%@", [NSThread currentThread]);
    });
    
    //通知三个图片下载完毕
    dispatch_group_notify(group, globalQueue, ^{
        NSLog(@"三个图片下载完毕：%@", [NSThread currentThread]);
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程更新UI界面");
        });
    });
    
    
    
    
    

}



@end
