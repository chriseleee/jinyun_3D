//
//  ViewController.m
//  Day07-4-SearchBeforeiOS8
//
//  Created by tarena on 15/8/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>
@property(nonatomic,strong) NSArray *products;
//定义一个可变数组，存放搜索结果
@property(nonatomic,strong) NSMutableArray *results;
@end
@implementation ViewController
- (NSMutableArray *)results{
    if (!_results) {
        _results = [NSMutableArray new];
    }
    return _results;
}
//只要在搜索框中修改搜索的内容，立即调用此方法
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
//searchString 就是用户输入的内容
//找出包含 searchString 并且 类型符合的产品
//获取到当前用户选择的产品类型，scope中选了那个按钮
    NSInteger selectedScope = self.searchDisplayController.searchBar.selectedScopeButtonIndex;
    //搜索之前要清空搜索数组
    [self.results removeAllObjects];
    for (Product *p in self.products) {
//判断输入的searhString是否在p的name中出现了
//使用NSRange来做这件事
//NSRange 包含两部分，location 和 length
//location记录的是name中含有searchString的位置
//length记录占用的长度
//可以判断长度为0 或者 location没找到 来确定有没有搜索到
        NSRange range = [p.name rangeOfString:searchString];
        if (range.location != NSNotFound && p.type == selectedScope ) {
            [self.results addObject:p];
        }
    }
    return YES;
}
//选定一个scope的时候，就会立即出发下面的方法
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
//获取此时搜索框中的文本
    NSString *searhText = self.searchDisplayController.searchBar.text;
    [self.results removeAllObjects];
    for (Product *p in self.products) {
        NSRange range = [p.name rangeOfString:searhText];
        if (range.location != NSNotFound && p.type == searchOption) {
            [self.results addObject:p];
        }
    }
    return YES;
}
- (NSArray *)products{
    if (!_products) {
        _products = [Product demoData];
    }
    return _products;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//如果是搜索列表进入代理 则返回
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return self.results.count;
    }else{
      return self.products.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//如果是搜索列表进入的话，就要使用唯一标识是 SearchCell
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
        Product *p = self.results[indexPath.row];
        cell.textLabel.text = p.name;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell0"];
    Product *p = self.products[indexPath.row];
    cell.textLabel.text = p.name;
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//为用于展示搜索结果的表格注册单元格
    [self.searchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SearchCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
