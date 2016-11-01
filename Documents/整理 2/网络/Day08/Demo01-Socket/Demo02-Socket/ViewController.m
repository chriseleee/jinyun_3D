//
//  ViewController.m
//  Demo02-Socket
//
//  Created by tarena on 15/9/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, NSStreamDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

//输入流(读)
@property (nonatomic, strong) NSInputStream *inputStream;

//输出流(写)
@property (nonatomic, strong) NSOutputStream *outputStream;

//存放服务器返回消息的可变数组
@property (nonatomic, strong) NSMutableArray *messageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化可变数组对象
    self.messageArray = [NSMutableArray array];
    
    //设置delegate
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //准备工作：和服务器端进行连接
    [self createConnectionToServer];

}

- (void)createConnectionToServer {
    //telnet 196.112.122.11 1025
    
    //创建两个stream相关的类
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    //NSStream不具有连接服务器的功能
    //创建和服务器的连接
    /**
     第二个参数：连接服务器的ip地址 (localhost)
     第三个参数：指定端口
     */
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 1025, &readStream, &writeStream);
    
    //将底层的CFStream转换成NSStream相关的类
    self.inputStream = (__bridge NSInputStream *)readStream;
    self.outputStream = (__bridge NSOutputStream *)writeStream;
    
    //设置两个stream的delegate
    self.inputStream.delegate = self;
    self.outputStream.delegate = self;
    
    //把这两个stream添加到runloop中(原因：才可以响应对应的代理方法)
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //将两个stream打开
    [self.inputStream open];
    [self.outputStream open];
}

- (IBAction)enterChatRoom:(id)sender {
    //iam:xxxxx
    NSString *text = @"iam:Maggie";
    
    //NSString --> NSData
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    //写数据(OutputSteam)
    [self.outputStream write:[data bytes] maxLength:[data length]];
}

- (IBAction)sendMessage:(id)sender {
    //发送消息到服务器端(msg:xxxxx)
    NSString *messageStr = [NSString stringWithFormat:@"msg:%@", self.messageTextField.text];
    
    //往outputStream中写数据
    NSData *data = [messageStr dataUsingEncoding:NSUTF8StringEncoding];
    [self.outputStream write:[data bytes] maxLength:[data length]];
    
    //清空textField文本
    self.messageTextField.text = nil;
}


#pragma mark -- NSStreamDelegate
//针对两个管道Stream, 处理不同的事件
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            NSLog(@"Stream打开");
            break;
        case NSStreamEventHasSpaceAvailable:
            NSLog(@"Stream还有空间可以放数据");
            break;
        case NSStreamEventHasBytesAvailable:
            NSLog(@"此时Stream有数据");
            [self readBytes:aStream];
            break;
        case NSStreamEventErrorOccurred:
            NSLog(@"有错误出现");
            //把stream关掉
            [self.inputStream close];
            [self.outputStream close];
            //从runloop中移除
            [self.inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            [self.outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            break;
            
        default:
            break;
    }
    
}

- (void)readBytes:(NSStream *)aStream {
    //将数据显示在table view上
    //首先判定是服务器返回的(将服务器消息显示在table view上)
    if (aStream == self.inputStream) {
        unsigned char readData[1024];
        //读取输入流的数据(服务器返回来的数据)
        while ([self.inputStream hasBytesAvailable]) {
            //获取服务器返回的数据
            /**
             第一个参数:读取的数据存放对象
             第二个参数:读取的最大bytes数量
             */
            NSInteger length = [self.inputStream read:readData maxLength:sizeof(readData)];
            if (length > 0) {
                //读取到数据
                NSString *messageStr = [[NSString alloc] initWithBytes:readData length:length encoding:NSUTF8StringEncoding];
                //将获取到的字符串添加到可变数组中
                [self.messageArray addObject:messageStr];
                //显示在table view上
                [self.tableView reloadData];
                
            }
        }
    }
}

#pragma mark -- table view datasouce/delegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建identifier
    static NSString *cellID = @"messageCell";
    
    //从缓存池中获取cell(Reuse可复用性)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //如果缓存池中没有，再重新创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //设置cell文本属性
    cell.textLabel.text = self.messageArray[indexPath.row];
    
    return cell;
}








@end
