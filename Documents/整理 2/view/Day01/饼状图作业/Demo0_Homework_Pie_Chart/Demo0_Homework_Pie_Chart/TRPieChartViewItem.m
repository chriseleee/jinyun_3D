//
//  TRPieChartViewItem.m
//  Demo0_Homework_Pie_Chart
//
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPieChartViewItem.h"

@implementation TRPieChartViewItem

- (instancetype)initWithColor:(UIColor *)color andValue:(CGFloat)value{
    self = [super init];
    if (self) {
        self.color = color;
        self.value = value;
    }
    return  self;
}

@end
