//
//  ContactDetailViewController.m
//  Day09-4-LianXiRen
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ContactDetailViewController.h"

@interface ContactDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *sexLb;
@property (weak, nonatomic) IBOutlet UILabel *addressLb;

@end

@implementation ContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"联系人详情";
//通过传入的参数，配置界面标签中的内容。
    _nameLb.text = [@"姓名:" stringByAppendingString:_contact.name];
    _sexLb.text = [@"性别:" stringByAppendingString:_contact.sex];
    _addressLb.text = [@"地址:" stringByAppendingString:_contact.address];
    
    
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
