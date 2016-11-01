//
//  ViewController.m
//  Day01-1-Button
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//播放按钮的点击事件
- (IBAction)play:(UIButton *)sender {
//播放时，点击，变暂停
//暂停时，点击，变播放
//实际上就是两张图片的切换
//两张图片是通过按钮的selected属性的状态来切换的
    sender.selected = !sender.selected;
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
