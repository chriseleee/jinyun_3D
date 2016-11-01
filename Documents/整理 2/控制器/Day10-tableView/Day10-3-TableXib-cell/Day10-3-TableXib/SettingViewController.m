//
//  SettingViewController.m
//  Day10-3-TableXib
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UITableViewCell *logOutCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *onTimeClose;
//将那些需要通过数据来显示对应信息的控件，添加连线即可。
@property (weak, nonatomic) IBOutlet UILabel *noticeLb;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.tableHeaderView = _headerView;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: //分组1
            return 4;
            break;
        case 1: //分组2
            return 3;
            break;
        case 2: //分组3
            return 1;
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.section == 2) {
        cell = self.logOutCell;
    }
    if (indexPath.section == 1) {
//注意:通过xib新建的cell，拖拽进来生成的属性，只能使用一次。
        if (indexPath.row == 1) {
           cell = self.onTimeClose;
        }
        
    }
    
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
