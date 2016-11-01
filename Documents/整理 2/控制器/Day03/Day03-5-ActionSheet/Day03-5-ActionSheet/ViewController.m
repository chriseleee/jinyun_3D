//
//  ViewController.m
//  Day03-5-ActionSheet
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)showActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Title" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destruc" otherButtonTitles:@"1", @"2", nil];
    [actionSheet showInView:self.view];//    显示
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex %ld", buttonIndex);
//    获取按钮的题目
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"title %@", title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
