//
//  TRDetailViewController.m
//  Demo01-Review
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDetailViewController.h"
#import "TRImageCenter.h"

@interface TRDetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

//下载好的图片转换后的UIImageView
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置indicatorView
    [self.indicatorView startAnimating];
    
    //获取图片中心的单例对象
    TRImageCenter *imageCenter = [TRImageCenter sharedImageCenter];
    
    //内存缓存原理的实现
    //先从字典中查，是否存在
    UIImage *imageFromDic = imageCenter.cacheImagesDic[self.imageURL];
    if (imageFromDic != nil) {
        //已经下载过了
        //直接显示
        [self loadImage:imageFromDic];
    } else {
        //开始使用GCD的方式下载
        dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
        dispatch_async(globalQueue, ^{
            //子线程中下载图片
            NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            
            //回到主线程更新界面
            dispatch_async(dispatch_get_main_queue(), ^{
                //将加载好的图片存入可变字典中
                if (image != nil) {
                   imageCenter.cacheImagesDic[self.imageURL] = image;
                    [self loadImage:image];
                }
                
                
            });
        });
    }
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

- (void)loadImage:(UIImage *)image {
    //设置scrollView delegate/最大/最小倍数属性
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.2;
    
    self.imageView = [[UIImageView alloc] initWithImage:image];
    
    self.scrollView.contentSize = image.size;
    //停止动画
    [self.indicatorView stopAnimating];
    [self.scrollView addSubview:self.imageView];
}


- (IBAction)clickReturn:(id)sender {
    //收回弹出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- UIScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    //直接将下载好的图片返回
    return self.imageView;
}









@end
