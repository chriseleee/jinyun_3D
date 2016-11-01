//
//  ViewController.m
//  Day14-4-PassValueBack
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "GreenViewController.h"

@interface ViewController ()<GreenViewControllerDelegate>

@end

@implementation ViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GreenViewController *greenVC = segue.destinationViewController;
//连线跳转，值的回传，需要在prepare方法中设置目标控制器的代理
    greenVC.delegate = self;
}
- (void)returnMessage:(NSString *)msg{
//通过在xib中设置某个控件的tag值，然后就可以在代码中通过viewWithTag来取值了。
//注意viewWithTag方法返回的是UIView类型，我们用的时候需要强制类型转换，否则会报黄色错误
    UILabel *lb = (UILabel *)[self.view viewWithTag:100];
    lb.text = msg;
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
