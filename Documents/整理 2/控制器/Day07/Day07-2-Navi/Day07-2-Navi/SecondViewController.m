//
//  SecondViewController.m
//  Day07-2-Navi
//
//  Created by tarena on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//设置题目
    self.navigationItem.title = @"第二页";
//也可以self.title = @"第二页";
//添加垃圾桶到右上角
    UIBarButtonItem *trashItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
//添加操作
    self.navigationItem.rightBarButtonItem = trashItem;
//变颜色
    trashItem.tintColor = [UIColor cyanColor];
    
//左上角添加两个item，一个返回 一个搜索
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[backItem, searchItem];
//以下代码用于添加toolbar
    UIBarButtonItem *playItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil]; //播放
    UIBarButtonItem *rewindItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:nil action:nil]; //快退
    UIBarButtonItem *forwardItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:nil]; //快进
    self.toolbarItems = @[rewindItem, playItem,forwardItem];
//默认情况下 toolbar是隐藏的
    self.navigationController.toolbarHidden = NO;
//  加弹簧,让内容居中
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[flexItem,rewindItem, playItem,forwardItem, flexItem];
//  加距离，用木棍儿
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 40; //设置木棍长度
    self.toolbarItems = @[flexItem,rewindItem, fixedItem,playItem,fixedItem,forwardItem, flexItem];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
//界面将要显示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}
//界面将要消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = YES;
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
