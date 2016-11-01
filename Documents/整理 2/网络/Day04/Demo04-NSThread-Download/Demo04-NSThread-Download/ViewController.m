//
//  ViewController.m
//  Demo04-NSThread-Download
//
//  Created by tarena on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//线程
@property (nonatomic, strong) NSThread *thread;

//图片
@property (nonatomic, strong) UIImage *image;

@end

@implementation ViewController
//NSThread无法无法重复利用
//NSThread对象 --XXX--> 系统中线程(number=2/3/4/5)
//懒加载
- (NSThread *)thread {
    if (!_thread) {
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
        _thread.name = @"下载线程";
    }
    
    return _thread;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)downloadImageByThead:(id)sender {
//    //第二中方案：
//    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
//    self.thread.name = @"下载线程";
 
    //启动线程，开始执行downloadImage下载图片的方法
    //第一种方案：防止再次点击按钮crash情况
    //线程状态(了解)：isExecuting / isFinished
    if (self.thread.finished || self.thread.executing) {
        self.thread = nil;
    }
    
    [self.thread start];
    
    //打印内存空间
    NSInteger size = self.thread.stackSize;
    NSLog(@"内存空间:%ld", (long)size);
    
    //[NSThread exit]; 终止线程的执行逻辑
    //number：2/3/4/5
}

- (void)downloadImage {
    NSLog(@"开始下载：%@", [NSThread currentThread]);
    
    //NSString -> NSURL -> NSData -> UIImage
    NSString *imageStr = @"http://www.egouz.com/uploadfile/2015/0305/20150305103626911.jpg";
    NSURL *imageURL = [NSURL URLWithString:imageStr];
    //最耗时(下载图片)
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    self.image = [UIImage imageWithData:imageData];
    
    //情况一(不合规则):直接在子线程中将UIImage赋值给UIImageView
//    self.imageView.image = self.image;
    
    //情况二(正规): 回到主线程将UIImage赋值给UIImageView
    [self performSelectorOnMainThread:@selector(downloadFinish:) withObject:self.image waitUntilDone:YES];
}

- (void)downloadFinish:(UIImage *)image {
    //下面的逻辑是在主线程
    NSLog(@"下载完毕:%@", [NSThread currentThread]);
    self.imageView.image = self.image;
}






@end
