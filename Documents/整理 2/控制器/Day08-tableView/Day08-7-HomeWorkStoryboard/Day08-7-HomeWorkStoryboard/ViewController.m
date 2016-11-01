//
//  ViewController.m
//  Day08-7-HomeWorkStoryboard
//
//  Created by tarena on 15/8/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _fontSize = 100;
    self.title = [NSString stringWithFormat:@"%.0f", _fontSize];
}
//重写fontSize的setter方法
- (void)setFontSize:(CGFloat)fontSize{
    _fontSize = fontSize;
    self.title = [NSString stringWithFormat:@"%.0f", _fontSize];
}

- (IBAction)canSee:(id)sender {
//如果是在故事板中的界面，初始化一定要由故事板来负责。
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:vc animated:YES];
//添加⬇️即可实现，调用vc.view会导致先执行viewDidLoad
    vc.view.backgroundColor = [UIColor whiteColor];
    
    vc.fontSize = _fontSize - 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
