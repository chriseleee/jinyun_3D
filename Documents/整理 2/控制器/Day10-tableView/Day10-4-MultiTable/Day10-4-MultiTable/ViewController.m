//
//  ViewController.m
//  Day10-4-MultiTable
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *firstTableView;
@property (nonatomic, strong) UITableView *secondTableView;
@end
@implementation ViewController
- (UITableView *)firstTableView{
    if (!_firstTableView) {
        _firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) style:UITableViewStylePlain];
        _firstTableView.delegate = self;
        _firstTableView.dataSource = self;
    }
    return _firstTableView;
}
- (UITableView *)secondTableView{
    if (!_secondTableView) {
        _secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 220, 100, 200) style:UITableViewStylePlain];
        _secondTableView.delegate = self;
        _secondTableView.dataSource = self;
    }
    return _secondTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.firstTableView];
    [self.view addSubview:self.secondTableView];
}
#pragma mark - UITableViewDataSource
//1.两个table都只有一个分区
//2.table1 有5行， table2 有7行
//3.table1 显示Hello  table2显示Kitty
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//tableView参数，代表的是调用这个方法的对象
    if (tableView == _firstTableView) {
        return 5;
    }else{
        return 7;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    if (tableView == _firstTableView) {
        cell.textLabel.text = @"Hello";
    }else{
        cell.textLabel.text = @"Kitty";
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
