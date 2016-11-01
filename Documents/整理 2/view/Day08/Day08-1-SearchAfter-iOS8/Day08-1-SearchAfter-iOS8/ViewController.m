//
//  ViewController.m
//  Day08-1-SearchAfter-iOS8
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "SeachResultTableViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,UISearchResultsUpdating>
@property(nonatomic, strong) NSArray *products;
//用于控制所有结果显示的控制器 iOS8特有
@property(nonatomic,strong) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation ViewController
- (NSArray *)products{
    if (!_products) {
        _products = [Product demoData];
    }
    return _products;
}
#pragma mark - UITableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Product *p = self.products[indexPath.row];
    cell.textLabel.text = p.name;
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SeachResultTableViewController *resultVC = [SeachResultTableViewController new];
//初始化iOS独有的搜索控制器，传参是用于显示搜索结果的控制器
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
//设置显示的搜索条的大小和样式
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.scopeButtonTitles = @[@"设备",@"软件",@"其他"];
//设置搜索控制器结果更新时由谁来代理
    self.searchController.searchResultsUpdater = self;
//将搜索条添加到表头视图中
    self.tableView.tableHeaderView = self.searchController.searchBar;
//设置是否在数据发生变更时,允许切换控制器
    self.definesPresentationContext = YES;
//为了获取scope按钮改变的时机,需要设置搜索框的代理
//searchBar中包含一个文本框和一个分段控件
    self.searchController.searchBar.delegate = self;
}
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
//获取用户输入的搜索文本
    NSString *text = searchController.searchBar.text;
//获取用户选择的scope
    NSInteger selectedIndex = searchController.searchBar.selectedScopeButtonIndex;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (Product *p in self.products) {
        NSRange range = [p.name rangeOfString:text];
        if (range.location != NSNotFound && p.type == selectedIndex) {
            [tempArr addObject:p];
        }
    }
//把搜索结果传入到搜索结果展示控制器中，并刷新它的界面
    SeachResultTableViewController *searchVC = (SeachResultTableViewController *)searchController.searchResultsController;
    searchVC.resultArray = tempArr;
    [searchVC.tableView reloadData];
}
#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.searchController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
