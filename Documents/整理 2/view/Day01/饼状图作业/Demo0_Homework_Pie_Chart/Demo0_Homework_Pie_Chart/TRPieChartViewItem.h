//
//  TRPieChartViewItem.h
//  Demo0_Homework_Pie_Chart
//
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TRPieChartViewItem : NSObject

@property(nonatomic,strong)UIColor *color;
@property(nonatomic)CGFloat value;

-(instancetype)initWithColor:(UIColor *)color andValue:(CGFloat)value;

@end
