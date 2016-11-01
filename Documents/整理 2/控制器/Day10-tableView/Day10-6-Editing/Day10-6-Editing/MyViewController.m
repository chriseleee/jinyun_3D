//
//  MyViewController.m
//  Day10-6-Editing
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end
@implementation MyViewController
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
//添加A-Z
        for (int i = 'A'; i <= 'Z'; i ++) {
// [NSNumber numberWithInt:i] 等价于@(i)
// @1 和 1的区别   @1是NSNumber类型
            [_dataArr addObject:@(i)];
        }
    }
    return _dataArr;    }
- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
//添加右上角编辑按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTable:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editTable:)];
}
- (void)editTable:(UIBarButtonItem *)sender{
//开启表格的编辑模式 或关闭。
    [_tableView setEditing:!_tableView.editing animated:YES];
//根据表格的编辑模式，改变自己的题目
    sender.title = _tableView.editing?@"Done":@"Edit";
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
//通过行数。找到对应的数据
    NSNumber *num = self.dataArr[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%c", num.intValue];
    return cell;
}
//编辑模式需要代理支持，两问一答
//问题1:当前行是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 5) {
        return NO;
    }
    return YES;
}
//问题2:当前行的编辑样式是何种?
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
// 让最后一行显示插入模式，其他行显示删除模式
    if (indexPath.row == self.dataArr.count - 1) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
//试一试或运算效果,晚自习
//return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
}
//提交编辑后，做什么？
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//如果是删除模式,!!!!顺序很重要,写错就崩溃
//1.删除数据数组中对应的数据
        [self.dataArr removeObjectAtIndex:indexPath.row];
//2.更新界面,动画是枚举类型，超多，晚自习自己都试试效果
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:3];
    }else{
//   插入操作，顺序很重要
//1.修改数据
        [self.dataArr addObject:@100];
//2.更新界面
//新添加的数据的下标就是对应行的indexPath
//数据添加到数组最后位置上，所以它对应的下标是count-1
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.dataArr.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
// 实现了本代理，会自动实现左划删除功能。
}
//自定义删除按钮的名称
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
//实现行的移动，需要一问一答
//问1:改行是否可以移动?
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//答1:移动后做什么?
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    修改数据
//先把数据取出来
    NSNumber *num = self.dataArr[sourceIndexPath.row];
//从数组中删除原来的数据
    [self.dataArr removeObjectAtIndex:sourceIndexPath.row];
//再按照新的位置把数据插入到数组中
    [self.dataArr insertObject:num atIndex:destinationIndexPath.row];
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
