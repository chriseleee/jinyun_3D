//
//  DViewController.m
//  Day11-4-TabbarController
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()

@end

@implementation DViewController
- (id)init{
    if (self = [super init]) {
        self.title = @"D";
        self.tabBarItem.image = [UIImage imageNamed:@"line_ball"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"full_ball"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
