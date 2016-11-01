//
//  MyViewController.m
//  Day12-1-Homework-NewsNavi
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UIScrollViewDelegate>
//用于存储scroll中的 label对象
@property (nonatomic, strong) NSMutableArray *labels;
@end
@implementation MyViewController
- (NSMutableArray *)labels{
    if (!_labels) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
//替换导航栏默认的题目视图 titleView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
//凡是通过**.**view = view, 通常这种添加视图的方式，view的x，y是无效的。 例如titleView，tableHeaderView,tableFooterView......
    self.navigationItem.titleView = scrollView;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    NSArray *titleArr = @[@"新闻", @"科技",@"游戏",@"音乐",@"轻松一刻",@"体育",@"股市",@"军事"];
    for (int i = 0; i < titleArr.count; i++) {
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(i * 60 +70, 0, 60, 30)];
        lb.text = titleArr[i];
        [scrollView addSubview:lb];
        [self.labels addObject:lb];
    }
    scrollView.contentSize = CGSizeMake(titleArr.count * 60 + 70 + 70, 0);
//监测scrollView的内容位移，实时的
    scrollView.delegate = self;
}
//只要scrollView滚动，就会触发下方方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
// 来确定当前显示在时间下方的label是哪一个， 把这个label字体颜色变为红色， 其他label字体颜色应该为黑色
    CGPoint offSet = scrollView.contentOffset;
//每次偏移60像素，代表滑动了一个label， 所以可以通过偏移量除以60 来确定滑动了多少个label
    NSInteger index = (int)offSet.x / 60;
    for (int i = 0; i < self.labels.count; i ++) {
        UILabel *lb = self.labels[i];
        if (i == index) {
            lb.textColor = [UIColor redColor];
        }else{
            lb.textColor = [UIColor blackColor];
        }
    }
    
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
