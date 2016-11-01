//
//  CViewController.m
//  Day12-5-OtherControl
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@end
@implementation CViewController
- (id)init{
    if (self = [super init]) {
        self.title = @"时间控件";
    }
    return self;
}
- (IBAction)readTime:(id)sender {
//读取日期对象
    NSDate *date = _datePicker.date;
//格式化为 年-月-日 时:分:秒
    NSDateFormatter *formatter = [NSDateFormatter new];
//y-year M-month d-day H-hour m-minute s-second
    formatter.dateFormat = @"MM-dd-yyyy HH:mm:ss";
//用日期格式化类，格式化NSDate类型为 字符串类型
    _timeLb.text = [formatter stringFromDate:date];
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
