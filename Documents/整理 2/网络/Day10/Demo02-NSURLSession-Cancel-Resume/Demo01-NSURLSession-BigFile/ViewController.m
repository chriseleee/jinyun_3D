//
//  ViewController.m
//  Demo01-NSURLSession-BigFile
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

//下面的属性是针对断点续传
//声明一个session属性
@property (nonatomic, strong) NSURLSession *session;
//点击暂停的时候，存储目前下载的数据属性
@property (nonatomic, strong) NSData *resumeData;
//下载任务task属性
@property (nonatomic, strong) NSURLSessionDownloadTask *task;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化label文本
    self.progressLabel.text = @"0.0%";
}
//恢复下载(老的：Range:bytes=x-y)
- (IBAction)resumeDownload:(id)sender {
    if (self.resumeData == nil) {
        //非第一次点击恢复按钮
        return;
    }
    
    //将下载任务重新赋值(从哪个点开始继续下载)
    self.task = [self.session downloadTaskWithResumeData:self.resumeData];
    //执行新的下载任务(从self.resumeData开始继续下的任务)
    [self.task resume];
    
    //设置self.resumeData为空
    self.resumeData = nil;
    
    
}
//暂停下载
- (IBAction)stopDownload:(id)sender {
    if (self.task == nil) {
        //非第一次点击暂停按钮
        return;
    }
    [self.task cancelByProducingResumeData:^(NSData *resumeData) {
        //resumeData: 截止到点击暂停按钮时，已经下载的文件数据
        if (resumeData == nil) {
            NSLog(@"点击暂停服务器返回为空");
            return;
        }
        //将resumeData赋值给self.resumeData
        self.resumeData = resumeData;
        NSLog(@"暂停的数据:%@", resumeData);
        
        //将task任务赋值为nil
        self.task = nil;
    }];
}
- (IBAction)startDownloadBigFile:(id)sender {
    //1.创建请求request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.2.21/2.zip"]];
    
    //2.创建一个session
    /**
     defaultSessionConfiguration(缺省/默认的会话配置对象):使用沙盒来存储缓存数据
     ephemeralSessionConfiguration(临时的会话配置对象):使用内存来存储缓存的数据
     backgroundSessionConfiguration(后台的会话配置对象):当程序进入后台，默认启动一个子线程来处理网路请求
     */
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    /**
     第一个参数：会话配置的对象
     第二个参数：设定delegate
     第三个参数：给定一个队列，协议的方法会放到该队列中
     */
    //队列传值：nil --> 所有的协议的方法会在子线程中执行(一定要回到主线程来更新UI)
    //[NSOperationQueue mainQueue] --> 所有协议的方法会在主线程中完成 (主线程阻塞)
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    //3.创建下载的任务 (适合于下载大的文件/音频, 监控进度)
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    self.task = [self.session downloadTaskWithRequest:request];
    
    //4.开始执行任务
    [self.task resume];
}

#pragma mark --- 实现监控下载进度的方法
//整个文件下载"完毕"的调用方法
//location: 整个文件下载后存放位置 (沙盒)
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"线程:%@; 位置:%@", [NSThread currentThread], location);//tmp
    
    //将默认tmp目录下的文件移动到/Libary/Caches/???
    NSString *cachesStr = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [cachesStr stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    //http://localhost/BigFile.zip
    NSError *moveError = nil;
    [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:filePath error:&moveError];
    if (moveError) {
        NSLog(@"移动文件失败:%@", moveError.userInfo);
    }
    
}
//didReceiveData作用类似
//调用多次；只要服务器返回数据就会调用该方法
/**
 bytesWritten: 这一次/某一次服务器返回的数据大小(bytes)
 totalBytesWritten:截止到目前位置服务器返回的数据大小(bytes)
 totalBytesExpectedToWrite:服务器返回的预计要下载的整个文件的大小
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    //计算进度
    double progress = (double)totalBytesWritten / totalBytesExpectedToWrite;
    
    NSLog(@"下载进度：%f", progress);
    NSString *progressStr = [NSString stringWithFormat:@"%.1f%%", progress*100];
    
    //子线程(nil队列类型)
    //回到主线程更新UIProgressView
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
        
        self.progressLabel.text = progressStr;
    });
    
    
}








@end
