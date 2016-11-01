//
//  ViewController.m
//  Demo03-NSFilemanager
//
//  Created by tarena on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *documentsPath;
///Documents/test/文件夹路径
@property (nonatomic, strong) NSString *testPath;
//文件管理对象属性
@property (nonatomic, strong) NSFileManager *fileMgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化属性对象
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //拼接test文件夹的路径
    self.testPath = [self.documentsPath stringByAppendingPathComponent:@"test"];
    self.fileMgr = [NSFileManager defaultManager];
}

- (IBAction)createDirectoryTwoFiles:(id)sender {
    //1.创建test文件夹
    /**第二个参数：YES: 允许有重复的文件夹test存在
     NO: 不允许有test文件夹存在(Xcode6每次会创建不同的Documnets文件夹)
     第三个参数：attributes->属性(了解); nil:给定默认权限(读/写/执行)
     */
    NSError *error = nil;
    BOOL isSucccess = [self.fileMgr createDirectoryAtPath:self.testPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!isSucccess) {
        NSLog(@"创建test目录失败: %@", error.userInfo);
    }
    
//    //2.创建test01.txt; test02.txt文件
//    //2.1 拼接文件路径
//    NSString *testFilePath = [self.testPath stringByAppendingPathComponent:@"test01.txt"];
//    NSString *secondTestFilePath = [self.testPath stringByAppendingPathComponent:@"test02.txt"];
//    //2.2 写入内容
//    NSString *content = @"第一个文件测试内容";
//    NSString *secondContent = @"第二个文件测试内容";
//    //2.3 创建文件;并写入
//    //将写入的内容转成NSData类型
    isSucccess = [self.fileMgr createFileAtPath:testFilePath contents:[content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
//    if (isSucccess) {
//        NSLog(@"写入第一个文件成功");
//    }
//    
//    isSucccess = [self.fileMgr createFileAtPath:secondTestFilePath contents:[secondContent dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
//    if (isSucccess) {
//        NSLog(@"写入第二个文件成功");
//    }
}

- (IBAction)getAllFiles:(id)sender {
    //Documents/test/下面的所有文件方式一：
    NSError *error = nil;
    NSArray *array = [self.fileMgr subpathsOfDirectoryAtPath:self.testPath error:&error];
    for (NSString *objStr in array) {
        NSLog(@"文件名字：%@", objStr);
    }
    
    //方式二：使用迭代器方式获取所有文件(了解)
    NSDirectoryEnumerator *enumerator = [self.fileMgr enumeratorAtPath:self.testPath];
    NSString *obj = nil;
    while (obj = [enumerator nextObject]) {
        NSLog(@"使用迭代器文件名字：%@", obj);
    }
    
}

- (IBAction)copyToFile:(id)sender {
    //source:test01.txt -> target:testCopy.txt
    NSString *soureFilePath = [self.testPath stringByAppendingPathComponent:@"test01.txt"];
    NSString *targetFilePath = [self.testPath stringByAppendingPathComponent:@"testCopy.txt"];
    /**
     第二个参数：对应的文件必须不能存在(默认创建testCopy.txt文件)
     */
    NSError *error = nil;
    //判定testCopy.txt是否存在
    if(![self.fileMgr fileExistsAtPath:targetFilePath]) {
        if (![self.fileMgr copyItemAtPath:soureFilePath toPath:targetFilePath error:&error]) {
            NSLog(@"拷贝失败：%@", error.userInfo);
        }
    } else {
        NSLog(@"testCopy.txt文件已经存在");
    }
}

- (IBAction)deleteFile:(id)sender {
    //删除testCopy.txt文件
    NSString *copyFilePath = [self.testPath stringByAppendingPathComponent:@"testCopy.txt"];
    NSError *error = nil;
    if(![self.fileMgr removeItemAtPath:copyFilePath error:&error]) {
        NSLog(@"删除testCopy.txt文件失败：%@", error.userInfo);
    }
}

//了解: NSURL
- (IBAction)createDirectoryByURL:(id)sender {
    //创建urlTest文件夹
    //file：本地协议
    NSString *dirStr = @"file:///Users/tarena03/Desktop/urlTest";
    NSLog(@"%@",dirStr);
    NSURL *url = [NSURL URLWithString:dirStr];
    
    if(![self.fileMgr createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:nil]) {
        NSLog(@"使用url创建文件夹失败");
    } else {
        NSLog(@"创建成功");
    }
}


@end
