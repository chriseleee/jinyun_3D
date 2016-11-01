//
//  ViewController.m
//  Demo04-NSFileHandle
//
//  Created by tarena on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *documentsPath;
@property (nonatomic, strong) NSFileManager *fileMgr;
@property (nonatomic, strong) NSString *sourceFilePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    self.fileMgr = [NSFileManager defaultManager];
    self.sourceFilePath = [self.documentsPath stringByAppendingPathComponent:@"soruce.txt"];
    
}

- (IBAction)createFile:(id)sender {
//    self.documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    self.sourceFilePath = [self.documentsPath stringByAppendingPathComponent:@"source.txt"];
    
//    self.fileMgr = [NSFileManager defaultManager];
    
    //创建source.txt文件
    if(![self.fileMgr createFileAtPath:self.sourceFilePath contents:nil attributes:nil]) {
        NSLog(@"创建失败");
    }
    
    //1.针对sourceFilePath创建写句柄
    NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:self.sourceFilePath];
    
    NSString *content = @"写入测试内容";
    
    //2.写入content内容到sourceFilePath
    [writeFileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    
    //3.关闭句柄
    [writeFileHandle closeFile];
}

- (IBAction)copySmallFile:(id)sender {
    //source.txt --> target.txt
    //1.创建target.txt空文件
    NSString *targetFilePath = [self.documentsPath stringByAppendingPathComponent:@"target.txt"];
    //创建source.txt文件
    if(![self.fileMgr createFileAtPath:targetFilePath contents:nil attributes:nil]) {
        NSLog(@"创建目标文件失败");
    }
    
    //2.针对source.txt创建读句柄
    NSFileHandle *readFileHandle = [NSFileHandle fileHandleForReadingAtPath:self.sourceFilePath];
    
    //3.针对target.txt创建写句柄
    NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:targetFilePath];
    
    //4.将source.txt中数据写入target.txt
    NSData *sourceData = [readFileHandle readDataToEndOfFile] ;
    [writeFileHandle writeData:sourceData];
    
    //5.关闭两个句柄
    [readFileHandle closeFile];
    [writeFileHandle closeFile];
}

- (IBAction)copyLargeFile:(id)sender {
    //1.获取大的源文件
    NSString * sourcePath = [self.documentsPath stringByAppendingPathComponent:@"Quartz2D.pptx"];
    //2.创建一个空的目标文件
    NSString *targetPath = [self.documentsPath stringByAppendingPathComponent:@"target.pptx"];
    if (![self.fileMgr createFileAtPath:targetPath contents:nil attributes:nil]){
        NSLog(@"创建目标target.pdf失败");
    }
    //3.创建读、写句柄
    NSFileHandle *readFileHandle = [NSFileHandle fileHandleForReadingAtPath:sourcePath];
    NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:targetPath];
    //4.源文件的总长度(获取源文件的文件属性字典)
    NSError *error =nil;
    NSDictionary *sourceAttriDic = [self.fileMgr attributesOfItemAtPath:sourcePath error:&error];
    NSLog(@"源文件的字典:%@",sourceAttriDic);
    NSNumber *sourceTotalSize = [sourceAttriDic objectForKey:NSFileSize];
    
    //5.循环读取源文件的数据，写入目标文件
    BOOL isEnd = YES;
    //每次读取的文件大小
    NSInteger sizePerTimes = 500;
    //已经读取的数据量
    NSInteger readSize = 0;
    //源文件总长度
    NSInteger totalSize = [sourceTotalSize longValue];
    
    while (isEnd) {
        NSData *data = nil;
        //剩余数据大小
        NSInteger leftSize = totalSize -readSize;
        //剩余大小不足5000；
        if (leftSize < sizePerTimes) {
            //直接把剩下的数据读完
            data = [readFileHandle readDataToEndOfFile];
            //设置isEnd为NO,跳出循环
            isEnd = NO;
            
        }else{
            //每次读5000
            data = [readFileHandle readDataOfLength:sizePerTimes];
            //累加已经读取的数据
            readSize +=sizePerTimes;
            //挪动读取文件句柄对象到readSize偏移量
            [readFileHandle seekToFileOffset:readSize];
        }
        [writeFileHandle writeData:data];
    }
    //关闭两个句柄对象
    [readFileHandle closeFile];
    [writeFileHandle closeFile];
}




@end
