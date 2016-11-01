//
//  WelcomeViewController.m
//  TRMusic
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//打印self.view的宽度和高度
    NSLog(@"view.bounds %@", NSStringFromCGRect(self.view.frame));
    NSArray *imageNames = @[@"Welcome_3.0_1", @"Welcome_3.0_2",@"Welcome_3.0_3",@"Welcome_3.0_4",@"Welcome_3.0_5"];
    for (int i = 0; i < imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNames[i]]];
        imageView.frame = CGRectMake(self.view.bounds.size.width *i, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [_scrollView addSubview:imageView];
//当循环到最后一张图片时，为这张图片添加点击事件
        if (i == imageNames.count - 1) {
            UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [imageView addGestureRecognizer:tapGR];
            imageView.userInteractionEnabled = YES;
        }
    }
//设置滚动区域大小
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width *imageNames.count, 0);
//设置页数
    _pageControl.numberOfPages = imageNames.count;
}
- (void)tap:(UITapGestureRecognizer *)gr{
    NSLog(@"进入主页面");
//我只想获取指针，进行跳转操作，所以用id就可以了
    id vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
//欢迎页面是window的根视图控制器， 跳转操作实际上是替换了wiindow的根视图控制器
//[UIApplication sharedApplication] 可以在任意代码位置，获得当前appdelegate在内存中的对象指针
// makeKeyAndVisible, 代表把window变为keyWindow并且可视
//    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
//还可以 直接获取当前view的窗口
    self.view.window.rootViewController = vc;
}

//监控滚动视图的滚动事件，计算当前页数，改变页数控制器
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//当前页数=滚动视图偏移量/每页的宽度, 除完是浮点型，需要转化为整型
//使用 lrintf方法，可以转换浮点型为整型
    NSInteger pageIndex = lrintf(scrollView.contentOffset.x / scrollView.frame.size.width);
    _pageControl.currentPage = pageIndex;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
