//
//  BlueViewController.m
//  Day14-3-PassValue
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _label.text = _message;
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
