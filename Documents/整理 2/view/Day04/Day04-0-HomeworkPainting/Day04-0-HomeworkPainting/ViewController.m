//
//  ViewController.m
//  Day04-0-HomeworkPainting
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "PaintingView.h"
#import "Setting.h"

@interface ViewController ()
@property(nonatomic, strong) Setting *set;
@property (weak, nonatomic) IBOutlet PaintingView *paintingView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmented;
@property (weak, nonatomic) IBOutlet UIStepper *widthStepper;
@end

@implementation ViewController
//分段控制器的 valueChange
- (IBAction)changeColor:(id)sender {
    switch (_colorSegmented.selectedSegmentIndex) {
        case 0:
            self.set.lineColor = [UIColor redColor];
            break;
        case 1:
            self.set.lineColor = [UIColor greenColor];
            break;
        case 2:
            self.set.lineColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}
//Stepper的 valueChange
- (IBAction)changeLineWidth:(id)sender {
    self.set.lineWidth = _widthStepper.value;
}
//开关的  valueChange
- (IBAction)isUseRubber:(id)sender {
//隐式声明
    UISwitch *s = (UISwitch *)sender;
    self.set.rubber = s.isOn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.set.lineColor = [UIColor redColor];
    self.set.lineWidth = self.widthStepper.value;
    self.set.rubber = NO;
    self.paintingView.currentSetting = self.set;
}
- (Setting *)set{
    if (!_set) {
        _set = [Setting new];
    }
    return _set;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
