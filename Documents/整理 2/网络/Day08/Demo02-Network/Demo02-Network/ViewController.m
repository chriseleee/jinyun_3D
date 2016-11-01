//
//  ViewController.m
//  Demo02-Network
//
//  Created by tarena on 15/9/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

//界面输入的URL
@property (nonatomic, strong) NSURL *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//发送请求Request ---> 接收响应Response
- (IBAction)sendSyncRequest:(id)sender {
    //NSURLConnection
    //1.创建一个客户端发送请求对象
    self.url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.url];
    //2.开始执行发送的同步请求
    //3.获取服务器返回的html文件
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&error];
    if (error) {
        NSLog(@"发送请求失败:%@", error.userInfo);
        return;
    }
    
    //4.并显示在UIWebView上
    [self.webView loadData:data
                  MIMEType:@"text/html"
          textEncodingName:@"utf-8"
                   baseURL:nil];
    
    NSLog(@"请求执行完毕%@; 数据的大小%lu", [NSThread currentThread], (unsigned long)data.length);
}


- (IBAction)sendAsyncRequest:(id)sender {
    
    //1.创建客户端发送请求对象
    self.url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    //2.异步执行请求
    //创建非主队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //获取response的状态码(判定服务器是否返回成功200)
        //data:服务器返回的数据
        //connectionError：具体的错误
        NSLog(@"返回%@", [NSThread currentThread]);
        NSInteger retStatusCode = [(NSHTTPURLResponse *)response statusCode];
        if (retStatusCode == 200) {
            //回到主线程更新界面UIWebView
            dispatch_async(dispatch_get_main_queue(), ^{
                //3.显示服务器返回的数据到UIWebView
                [self.webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:nil];
            });
        } else {
            NSLog(@"失败%@",connectionError.userInfo);
        }
    }];
    
    
    
    
    
    
    
    
}





@end
