//
//  ViewController.m
//  Day09-1-Homework
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *names;
@end

@implementation ViewController

- (NSArray *)names
{
    if (!_names) {
        _names = @[@"Lili", @"HanMM", @"Jone", @"Marry"];
    }
    return _names;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//[UIScreen mainScreen].bounds  行
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

#pragma mark - UITableViewDataSource
//1.问有多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//2.每个分区中有多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//应该有人名数量相同的cell,数组是懒加载，一定要用self.
    return self.names.count;
}
//3.每个分区显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//先去重用队列中获取名字是***的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
//如果取不到，那么需要自己新建一个
//cell == nil 等价于 !cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
//indexPath就是section和row的集合体，可以表示一个cell的位置。
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end







