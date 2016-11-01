//
//  MyView.m
//  Day02-1-BezerPaht-Other
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView
-(void)drawRect:(CGRect)rect{
//画椭圆
    UIBezierPath *path3 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    path3.lineWidth = 4;
    [[UIColor redColor] setStroke];
    [path3 stroke];
//画圆角矩形,cornerRadius圆角的弧度值
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 120, 200, 100) cornerRadius:30];
    path4.lineWidth = 2;
    [[UIColor blueColor] setStroke];
    [path4 stroke];
//画左括号
    UIBezierPath *path5 = [UIBezierPath bezierPath];
    [path5 moveToPoint:CGPointMake(140, 40)];
    [path5 addCurveToPoint:CGPointMake(40, 140) controlPoint1:CGPointMake(40, 40) controlPoint2:CGPointMake(140, 140)];
    [path5 addCurveToPoint:CGPointMake(140, 240) controlPoint1:CGPointMake(140, 140) controlPoint2:CGPointMake(40, 240)];
    path5.lineWidth = 2;
    [path5 stroke];
    
    
}




@end












