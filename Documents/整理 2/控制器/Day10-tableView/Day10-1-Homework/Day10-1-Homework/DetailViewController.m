//
//  DetailViewController.m
//  Day10-1-Homework
//
//  Created by tarena on 15/8/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *phoneLb;
@property (weak, nonatomic) IBOutlet UILabel *addressLb;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addressLb.text = _contactDic[@"address"];
    _nameLb.text = _contactDic[@"name"];
    _phoneLb.text = _contactDic[@"phone"];
    self.title = @"联系人详情";
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
