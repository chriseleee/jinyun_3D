//
//  ViewController.m
//  Demo05-NSURLSession-Pic
//
//  Created by tarena on 15/9/14.
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

- (IBAction)startDownloadImage:(id)sender {
    //1. 创建下载图片的request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.egouz.com/uploadfile/2015/0305/20150305103626911.jpg"]];
    
    //2. 创建会话session对象(单例session对象)
    NSURLSession *session = [NSURLSession sharedSession];
    
    //3. 创建下载任务对象
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        //下载的逻辑处理
//        NSLog(@"线程:%@", [NSThread currentThread]);
//        NSLog(@"存放图片的位置：%@", location);
        
        //将location下存储的临时图片移到/Library/Caches/test.jpg
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *filePath = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        NSError *moveError = nil;
        [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:filePath error:&moveError];
        if (moveError == nil) {
            //获取下载图片的数据
            UIImage *image = [UIImage imageWithContentsOfFile:filePath];
            
            //回到主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
            
        } else {
            NSLog(@"从tmp拷贝文件失败:%@", moveError.userInfo);
        }
        
        
        
        
    }];
    
    //4. 执行下载任务
    [task resume];
}





@end
