//
//  ContactViewController.m
//  Day10-1-Homework
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ContactViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"

@interface ContactViewController ()<UITableViewDataSource, UITableViewDelegate, AddViewControllerDelegate>
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property(nonatomic, strong) UITableView *tableView;
//用于存放添加进来的联系人，由于是不断增加的，所以需要使用可变数组
@property (nonatomic, strong) NSMutableArray *dataArr;
@end
@implementation ContactViewController
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIBarButtonItem *)rightItem{
    if (!_rightItem) {
        _rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd)];
    }
    return _rightItem;
}
- (void)clickAdd{
    NSLog(@"跳转到添加联系人界面");
    AddViewController *addVC = [AddViewController new];
    addVC.delegate = self;
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)addContactWithName:(NSString *)name phone:(NSString *)phone address:(NSString *)address{
//把回传回来的联系人信息，组合成一个字典
    NSDictionary *dic = @{@"name": name,
                          @"phone": phone,
                          @"address": address};
//把字典放入数组中，通过数组，让表格显示
    [self.dataArr addObject:dic];
//因为表格数据发生变化,刷新表格。
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系人";
//添加右上角加号按钮,使用懒加载
    self.navigationItem.rightBarButtonItem = self.rightItem;
//用懒加载的方式添加TableView
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MyCell"];
        cell.accessoryType = 1; //右侧箭头
    }
//根据行数，来取得对应的字典
    NSDictionary *dic = self.dataArr[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    cell.detailTextLabel.text = dic[@"phone"];
    return cell;
}

#pragma makr - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//点击某行时触发
    DetailViewController *detailVC = [DetailViewController new];
//根据行数获得对应的数据
    detailVC.contactDic = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
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
