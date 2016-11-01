//
//  ViewController.m
//  CardGame
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//为了统一管理系统创建的12个按钮，所以准备了一个数组来存储12个按钮的引用
//数组不是系统创建的，是我们为了存引用添加的，所以要用strong
//但是数组中存储的所有按钮的引用都是weak，因为按钮是系统创建的

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)chooseCard:(id)sender {
    NSInteger index = [_buttons indexOfObject:sender];
    NSLog(@"%ld", index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
