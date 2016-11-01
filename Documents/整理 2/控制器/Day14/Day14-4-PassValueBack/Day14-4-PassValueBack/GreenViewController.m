//
//  GreenViewController.m
//  Day14-4-PassValueBack
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end
@implementation GreenViewController
- (IBAction)back:(id)sender {
    [_delegate returnMessage:_textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
