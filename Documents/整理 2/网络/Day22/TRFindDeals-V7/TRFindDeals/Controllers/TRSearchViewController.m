//
//  TRSearchViewController.m
//  TRTuanDeal
//
//  Created by Xiao on 15/10/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRSearchViewController.h"
#import "UIBarButtonItem+TRBarButtonItem.h"

@interface TRSearchViewController () <UISearchBarDelegate>

@end

@implementation TRSearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 左边的返回
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_back" withHighlightedImageName:@"icon_back_highlighted" target:self withAction:@selector(clickBack)];
    
    // 中间的搜索框
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"请输入搜索关键词";
    //设置搜索bar的代理
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
}

- (void)clickBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 搜索框代理
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //发送请求 (已经通过settingParams方法设置完搜索需要的所有参数)
    [self loadNewDeals];
    
    // 收回键盘
    [searchBar resignFirstResponder];
}

#pragma mark - 实现父类提供的方法
- (void)settingParams:(NSMutableDictionary *)params
{
    params[@"city"] = self.cityName;
    
    //将界面中用户输入的搜索文本赋值给keyword
    UISearchBar *bar = (UISearchBar *)self.navigationItem.titleView;
    params[@"keyword"] = bar.text;
}

@end
