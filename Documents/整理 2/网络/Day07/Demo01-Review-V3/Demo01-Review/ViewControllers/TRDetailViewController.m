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

//图片的URL
@property (nonatomic, strong) NSURL *imageURL;
//图片的名字
@property (nonatomic, strong) NSString *imageName;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;

@end

@implementation TRDetailViewController

- (id)initWithImageURL:(NSURL *)url withImageName:(NSString *)imageName {
    
    if (self = [super init]) {
        self.imageURL = url;
        self.imageName = imageName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //将navigation bar的title赋值
    self.navigationBar.title = self.imageName;
    
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
        //内存中没有图片数据
        //沙盒中是否存在数据
        NSString *filePath = [self genDownloadImagePathInSandbox:self.imageURL];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (data != nil) {
            //将沙盒中的数据显示到界面
            [self loadImage:[UIImage imageWithData:data]];
        } else {
            //开始使用GCD的方式下载
            dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
            dispatch_async(globalQueue, ^{
                //子线程中下载图片
                NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
                UIImage *image = [UIImage imageWithData:imageData];
                
                //回到主线程更新界面
                dispatch_async(dispatch_get_main_queue(), ^{
                    //将下载好的图片存入可变字典中
                    if (image != nil) {
                        imageCenter.cacheImagesDic[self.imageURL] = image;
                        
                        //将下载好的图片存入沙盒中(xxx/Libary/caches/)
                        //writeFilePath:xxxx/Libary/caches/photo_1.jpg
                        NSString *writeFilePath = [self genDownloadImagePathInSandbox:self.imageURL];
                        //写入下载的data到writeFilePath
                        [imageData writeToFile:writeFilePath atomically:YES];
                        
                        [self loadImage:image];
                    }
                });
            });
        }
        

    }
}

//拼接最终写入沙盒中的图片路径
- (NSString *)genDownloadImagePathInSandbox:(NSURL *)url {
    //1./Libary/caches/
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    //2.拼接路径
    //http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_1.jpg
    //xxx/Libary/caches/photo_1.jpg
    NSString *filePath = [cachesPath stringByAppendingPathComponent:[url lastPathComponent]];
    
    return filePath;
    
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
