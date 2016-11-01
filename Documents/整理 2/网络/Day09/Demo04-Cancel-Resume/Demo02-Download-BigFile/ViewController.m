//
//  ViewController.m
//  Demo02-Download-BigFile
//
//  Created by tarena on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

//沙盒caches属性(存储下载好的大文件)
@property (nonatomic, strong) NSString *cachesPath;

//存储每次服务器返回的NSData
@property (nonatomic, strong) NSMutableData *fileData;

//存储下载文件的总长度
@property (nonatomic, assign) long long totalLength;

//控制文件写句柄
@property (nonatomic, strong) NSFileHandle *writeFileHandle;

//下面的属性是为了断点续传增加
@property (nonatomic, strong) NSMutableURLRequest *request;
//url connection对象
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, assign) long long currentLength;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化两个属性
    self.cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    self.fileData = [NSMutableData data];

}

- (IBAction)startDownloadBigFile:(id)sender {
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/BigFile.zip"]];
    
    //初始化可变的请求对象
    self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/BigFile.zip"]];
    //设定第一次要请求的下载文件的范围 Range:bytes=0-
    self.currentLength = 0;
    NSString *valueStr = [NSString stringWithFormat:@"bytes=%lld-", self.currentLength];
    [self.request setValue:valueStr forHTTPHeaderField:@"Range"];
    
    //执行下载大文件的动作
    self.connection = [NSURLConnection connectionWithRequest:self.request delegate:self];
}

#pragma mark --- NSURLConnectionDataDelegate
//接收到服务器返回响应Response触发方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%s", __func__);//打印执行的方法名字
    //创建一个/Libary/Caches/yyyy的空文件
    NSString *filePath = [self.cachesPath stringByAppendingPathComponent:@"yyyy"];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    
    //初始化写文件句柄(指针)
    self.writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    //从response中的某个属性来获取整个文件的大小
    if (self.currentLength == 0){
        //表示第一次请求下载，self.totalLength才是文件的总长度
        self.totalLength = response.expectedContentLength;
    }
    
//    NSLog(@"111111111文件总长度:%lld", self.totalLength);
}

//接收到服务器返回的数据的触发方法
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //currentTotalLength: 到目前为止下载的数据大小
    static unsigned long currentTotalLength = 0;
    currentTotalLength += data.length;
    //重新赋值self.currentLength
    self.currentLength = currentTotalLength;
    //更新进度条
    self.progressView.progress = (double)currentTotalLength / self.totalLength;
//    NSLog(@"2222222文件总长度:%lld", self.totalLength);

    
    //先将服务器返回的数据写入yyyy文件中
    [self.writeFileHandle writeData:data];
    
    //挪动文件指针到文件的最后面
    [self.writeFileHandle seekToEndOfFile];
}

//已经接收到服务器返回的"所有"数据的触发方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%s", __func__);
    //收尾工作
    [self.writeFileHandle closeFile];

}

//服务器返回错误的触发方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%s", __func__);
    NSLog(@"有错误啦:%@", error.userInfo);
}

//停止下载
- (IBAction)stopDownload:(id)sender {
    [self.connection cancel];
}

//恢复下载
- (IBAction)resumeDownload:(id)sender {
    //重新发送请求Range:bytes=self.currentLength-
    NSString *valueStr = [NSString stringWithFormat:@"bytes=%lld-", self.currentLength];
    [self.request setValue:valueStr forHTTPHeaderField:@"Range"];
    self.connection = [NSURLConnection connectionWithRequest:self.request delegate:self];
}









@end
