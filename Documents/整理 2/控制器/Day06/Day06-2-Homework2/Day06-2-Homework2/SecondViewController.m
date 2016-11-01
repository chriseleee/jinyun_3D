//
//  SecondViewController.m
//  Day06-2-Homework2
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *xTF;
@property (weak, nonatomic) IBOutlet UITextField *yTF;
@property (weak, nonatomic) IBOutlet UITextField *widthTF;
@property (weak, nonatomic) IBOutlet UITextField *heightTF;
@property (weak, nonatomic) IBOutlet UITextField *contentTF;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//确认按钮的点击事件
- (IBAction)click:(id)sender {
    CGRect rect = CGRectMake(_xTF.text.doubleValue, _yTF.text.doubleValue, _widthTF.text.doubleValue, _heightTF.text.doubleValue);
    [_delegate makeTFWithRect:rect content:_contentTF.text];
    [self dismissViewControllerAnimated:YES completion:nil];
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
