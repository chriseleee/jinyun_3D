//
//  ContactViewController.m
//  Day09-4-LianXiRen
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactDetailViewController.h"
#import "Contact.h"

@interface ContactViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *contacts;
@end
@implementation ContactViewController
- (NSArray *)contacts{
    if (!_contacts) {
        _contacts = [Contact contactArr];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"联系人";
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contacts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MyCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
//通过行数来获取对应的数据项
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.sex;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactDetailViewController *vc = [ContactDetailViewController new];
//根据点击的cell行数，获取对应的数据项
    Contact *contact = self.contacts[indexPath.row];
    vc.contact = contact;  //正向传参
    
    [self.navigationController pushViewController:vc animated:YES];
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
