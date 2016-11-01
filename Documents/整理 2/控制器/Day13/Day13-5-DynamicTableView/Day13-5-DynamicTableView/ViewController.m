//
//  ViewController.m
//  Day13-5-DynamicTableView
//
//  Created by tarena on 15/8/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//Row被4取余，0 显示cell0风格，1 显示cell1 ....
//如果要在表格中显示不同样式的Cell，主要是通过行数来判断应该使用的唯一标识，取得对应样式的Cell
//通过在Storyboard，选择cell，填写它的identify属性。故事板会自动完成注册的操作，唯一标识就是identify
    NSString *identify = [NSString stringWithFormat:@"Cell%d", indexPath.row%4];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.textLabel.text = @"张三";
    cell.detailTextLabel.text = @"12312312321";
    return cell;
}




@end
