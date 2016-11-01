//
//  ViewController.m
//  Day07-6-ScrollView
//
//  Created by tarena on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 100, 250, 400)];
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
//创建用于在内部显示的视图,主要为了测试滚动效果
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 800)];
    greenView.backgroundColor = [UIColor greenColor];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 600, 400)];
    redView.backgroundColor = [UIColor redColor];
    [greenView addSubview:redView];
//添加视图到 滚动视图中
    [scrollView addSubview:greenView];
//!!!注意，一定要告诉滚动视图，他内部的滚动区域有多大！！
    scrollView.contentSize = greenView.frame.size;
//  给scrollView一个唯一标识, tag是UIView的属性
    scrollView.tag = 1000;
    
//    设置边缘不能弹跳
    scrollView.bounces = NO;
//    设置横竖滚动条不显示
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
//    设置滚动视图的缩放
//    1.设置最大 和 最小缩放的比例
    scrollView.maximumZoomScale = 3;
    scrollView.minimumZoomScale = 0.1;
//    2.设置滚动视图代理
    scrollView.delegate = self;
//设置绿色视图tag值，方便代理中可以获取到它的指针。
    greenView.tag = 2000;
}
//返回一个视图，允许滚动视图进行缩放操作。
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"hahah%f",scrollView.contentSize.width);
    return [scrollView viewWithTag:2000];
}

- (IBAction)move:(id)sender {
//通过tag值获得self.view子view中对应的view
//viewWithTag返回值是UIView，会有警告，可以强制类型转换
    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:1000];
//每次点击，内部内容左上角移动100，100像素--课后练习
//滚动视图的contentoffset属性来实现
    [scrollView setContentOffset:CGPointMake(500, 500) animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






