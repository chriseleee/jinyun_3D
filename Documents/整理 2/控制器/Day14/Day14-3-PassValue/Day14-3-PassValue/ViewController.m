//
//  ViewController.m
//  Day14-3-PassValue
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "BlueViewController.h"

@interface ViewController ()
@end
@implementation ViewController
//捕捉跳转操作的触发事件,需要重写下面的方法
//segue:跳转， 对象中包含了三个属性
//目标控制器，当前控制器，跳转操作的唯一标识
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BlueViewController *blueVC = segue.destinationViewController;
    if([segue.identifier isEqualToString:@"iOS"]){
        blueVC.message = @"iOS";
    }else{
        blueVC.message = @"Android";
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
