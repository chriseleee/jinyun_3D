//
//  ViewController.m
//  Day02-3-UISlider
//
//  Created by tarena on 15/7/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//  设置label的背景颜色
//    参数取值范围是0 - 1
//    alpha是透明度，0透明， 1不透明
    _label.textColor = [UIColor colorWithRed:0.4 green:0.5 blue:0.6 alpha:0];
    
    
}
- (IBAction)slide:(UISlider *)sender {
    _label.text = [NSString stringWithFormat:@"%.0f", sender.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
