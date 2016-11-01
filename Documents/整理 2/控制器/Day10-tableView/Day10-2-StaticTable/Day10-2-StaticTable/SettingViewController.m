//
//  SettingViewController.m
//  Day10-2-StaticTable
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//设置表格的脚
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.view.frame.size.width - 40, 40)];
    label.text = @"如果遇到账号信息泄露或其他安全问题，那么请联系客服进行沟通解决.";
    label.font = [UIFont systemFontOfSize:13];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    [footerView addSubview:label];
//table的脚视图设置 不能用addsubview，必须用下面的方法
    _tableView.tableFooterView = footerView;
}
#pragma mark - UITableViewDataSource
//问题1:有多少个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//问题2:每个分组中有多少条
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//从UI看到，分组1有一条，其他分组是3条
    if (section == 0) {
        return 1;
    }else{
        return 3;
    }
}
//问题3:每一条显示什么样子
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//因为条数有限，且样式各不相同，所以不适用 重用方式
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    switch (indexPath.section) {
        case 0: //第一分区
            cell.textLabel.text = @"微信号";
            cell.detailTextLabel.text = @"iOS_yingxin";
            break;
        case 1: //第二分区
//每个分区的row 都是独立计算的，都是从0开始
            cell.accessoryType = 1;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"QQ号";
                cell.detailTextLabel.text = @"111";
            }else if(indexPath.row == 1){
                cell.textLabel.text = @"手机号";
                cell.detailTextLabel.text =@"136";
            }else{
                cell.textLabel.text = @"邮箱地址";
                cell.detailTextLabel.text = @"11@qq.com";
            }
            break;
        case 2: //第三分区
            cell.accessoryType = 1;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"微信密码";
            }else if(indexPath.row == 1){
                cell.textLabel.text = @"账号保护";
                cell.detailTextLabel.text = @"已保护";
//添加图片到cell上
                UIImageView *lockIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock"]];
                lockIV.frame = CGRectMake(215, 12, 20, 20);
//注意要把控件加载到contentView中
                [cell.contentView addSubview:lockIV];
            }else{
                cell.textLabel.text = @"微信安全中心";
            }
            break;
        default:
            break;
    }
    return cell;
}
//让分区的头部更高一些
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 60;
    }else{
        return 10;
    }
}
//不管是头还是脚，高度的最小值是1
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
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
