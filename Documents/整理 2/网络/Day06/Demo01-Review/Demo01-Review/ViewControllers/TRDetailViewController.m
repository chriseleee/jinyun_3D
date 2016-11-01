//
//  TRDetailViewController.m
//  Demo01-Review
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDetailViewController.h"

@interface TRDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation TRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置indicatorView
    [self.indicatorView startAnimating];
    
    //开始使用GCD的方式下载
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        //子线程中下载图片
        NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
        UIImage *image = [UIImage imageWithData:imageData];

        
        //回到主线程更新界面
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            self.scrollView.contentSize = image.size;
            //停止动画
            [self.indicatorView stopAnimating];
            [self.scrollView addSubview:imageView];
        });
    });
    
    
    
   //阻塞主线程的问题Bug
//    //下载图片(主线程阻塞)
//    NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
//    UIImage *image = [UIImage imageWithData:imageData];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    //将下载图片的原始大小赋值给scrollView的大小
//    self.scrollView.contentSize = image.size;
//    //显示在界面上(UIScrollView)
//    [self.scrollView addSubview:imageView];
    
}


- (IBAction)clickReturn:(id)sender {
    //收回弹出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
