//
//  ViewController.m
//  Day08-5-MutilSection
//
//  Created by tarena on 15/8/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//3个分区，第一个分区都显示Hello，第二个Helloworld，第三个HelloKitty
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
//1.多少个分组？
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//2.每个分组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
// 分组1 2行    分组2 5行  分组 3 有8行
    switch (section) {
        case 0: //分组1
            return 2;
            break;
        case 1: //分组2
            return 5;
            break;
        case 2: //分组3
            return 8;
            break;
        default: //默认值
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"Hello";
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = @"Hello World";
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = @"Hello Kitty";
    }
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




