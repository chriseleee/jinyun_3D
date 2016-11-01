//
//  NewsViewController.m
//  Day13-5-DynamicTableView
//
//  Created by tarena on 15/8/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSArray *dataArr;
@end
@implementation NewsViewController
- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [News demoData];
    }
    return _dataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
//根据行数Row来获取对应的数据项
    News *n = self.dataArr[indexPath.row];
//把数据项显示在界面上：两种方式
//方式一:通过声明cell的管理类，适合复杂界面
    cell.titleL.text = n.title;
    cell.commentL.text = n.commentNum;
//方式二:通过tag值,适合简单界面
//通过tag值取cell中对应的视图，注意一定要在storyboard中设置过对应的tag值才好用！
    UIImageView *iv = (UIImageView *)[cell.contentView viewWithTag:1000];
    iv.image = [UIImage imageNamed:n.imageName];
    
    return cell;
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
