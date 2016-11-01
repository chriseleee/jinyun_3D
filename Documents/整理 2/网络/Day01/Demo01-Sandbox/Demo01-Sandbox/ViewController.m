//
//  ViewController.m
//  Demo01-Sandbox
//
//  Created by tarena on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取沙盒根目录
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"根目录：%@", homeDirectory);
    
    //2.Documents目录
    /**第一个参数：获取目录对应的枚举值
     第二个参数：告诉从哪个域搜索(从当前登录用户所在的文件夹:/Users/tarena)
     第三个参数：是否扩展; yes:全路径打印；/Users/tarena/xxxx/Application/xxx
     no:相对路径: ~/Application
     return: 该方法返回一个只有唯一对象的数组NSArray
     */
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"documents路径：%@", documentsPath);
    
    //3.Library目录
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"library路径：%@", libraryPath);
    
    //4.tmp目录
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"tmp路径：%@", tmpPath);
}


@end
