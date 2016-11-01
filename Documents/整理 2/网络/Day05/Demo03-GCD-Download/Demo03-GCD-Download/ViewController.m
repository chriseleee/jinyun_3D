//
//  ViewController.m
//  Demo03-GCD-Download
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)downloadByGCD:(id)sender {
    
    //全局的队列 (并行)
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);//DEFAULT
    
    //异步发送下载图片的任务
    dispatch_async(globalQueue, ^{
        //子线程中实现下载任务
        NSLog(@"开始下载图片:%@", [NSThread currentThread]);
        
        //NSString -> NSURL -> NSData -> UIImage
        NSString *imageStr = @"http://www.egouz.com/uploadfile/2015/0305/20150305103653935.jpg";
        NSURL *imageURL = [NSURL URLWithString:imageStr];
        //下载
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        
        //下载第二个图片
        
        //下载第三个图片
        
        //....
        
        //回到主线程(方式二)更新界面的图片
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"界面更新完毕%@", [NSThread currentThread]);
        });
    });
    
    NSLog(@"程序结束");
}

@end
