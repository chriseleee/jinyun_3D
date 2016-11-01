//
//  ViewController.m
//  Demo02-CreateFile
//
//  Created by tarena on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *documentsPath;


@end

@implementation ViewController
//懒加载
- (NSString *)documentsPath {
    if (!_documentsPath) {
        _documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    }
    return _documentsPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)usingNSStringCreateFile:(id)sender {
    //Documents路径
    //拼接创建文件的路径:xxx/Documents/testString.txt
    NSString *filePath = [self.documentsPath stringByAppendingPathComponent:@"testString.txt"];
    
    NSString *content = @"111111使用NSString创建文件";
    
    //创建文件; 并将content内容写入文件中
    /**
     atomically: yes(建议): 首先创建一个辅助文件,写成功之后再写到filePath对应的文件中(写到中间出错,不会写入filePath对应的文件)
     no:没有辅助文件 ---> 写到中间出错，filePath只能看到部分数据
     */
    NSError *error = nil;
    BOOL isSuccess = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (!isSuccess) {
        NSLog(@"写入失败; 原因：%@", error.userInfo);
    }
    
    
}

- (IBAction)usingNSArrayCreateFile:(id)sender {
    
    NSArray *array = @[@"测试字符串", @(20), @[@"test", @(30)]];
    //拼接文件路径
    NSString *filePath = [self.documentsPath stringByAppendingPathComponent:@"testArray.txt"];
    BOOL isSuccess = [array writeToFile:filePath atomically:YES];
    if (isSuccess) {
        NSLog(@"写入成功");
    }
}




@end
