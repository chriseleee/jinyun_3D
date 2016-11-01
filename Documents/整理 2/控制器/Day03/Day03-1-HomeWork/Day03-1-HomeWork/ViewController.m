//
//  ViewController.m
//  Day03-1-HomeWork
//
//  Created by tarena on 15/8/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelForStepper;

@property (weak, nonatomic) IBOutlet UISlider *slider0;
@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UISlider *slider2;

@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UISwitch *switch2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeStep:(UIStepper *)sender {
    _labelForStepper.font = [UIFont systemFontOfSize:sender.value];
}

- (IBAction)changeSlider:(id)sender {
    _labelForStepper.backgroundColor = [UIColor colorWithRed:_slider0.value green:_slider1.value blue:_slider2.value alpha:1];
}

//swtich1发生更改，修改2的状态
- (IBAction)changeSwitch2:(UISwitch *)sender {
    [_switch2 setOn:sender.on animated:YES];
// 按钮1 on  按钮2 可用 yes
// 按钮1 off 按钮2 不可用 NO
    _switch2.enabled = sender.on;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
