//
//  ContactViewController.m
//  Day09-7-AddContact
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ContactViewController.h"
#import "AddViewController.h"

@interface ContactViewController ()<UITableViewDelegate, UITableViewDataSource, AddViewControllerDelegate>
@property(nonatomic, strong) NSMutableArray *nameArr;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
@implementation ContactViewController
- (NSMutableArray *)nameArr{
    if (!_nameArr) {
        _nameArr = [NSMutableArray array];
    }
    return _nameArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"联系人";
//    添加导航栏右侧的加号按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//点击加号触发的
- (void)addContact{
    AddViewController *addVC = [AddViewController new];
    addVC.delegate = self;
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)addContactName:(NSString *)name{
    [self.nameArr addObject:name];
//***************************************刷新tableView,重新载入数据
    [_table reloadData];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    cell.textLabel.text = self.nameArr[indexPath.row];
    return cell;
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
