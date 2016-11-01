//
//  MyView.m
//  Day01-7-BezierPath
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"
@implementation MyView
- (void)drawRect:(CGRect)rect{
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(40, 40)];
    [path0 addLineToPoint:CGPointMake(40, 140)];
    [path0 addLineToPoint:CGPointMake(140, 40)];
    [[UIColor redColor] setStroke];//设置描边儿的颜色
    [[UIColor greenColor] setFill];//设置填充的颜色
    path0.lineWidth = 20;//设置线宽
    path0.lineCapStyle = kCGLineCapButt;//设置线头儿的样式
    path0.lineJoinStyle = kCGLineJoinMiter;//设置两条线连接处的样式
    [path0 stroke];//描边儿
    [path0 fill];//填充
    //画椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    path.lineWidth = 4;
    [[UIColor redColor] setStroke];
    [path stroke];
    //画圆角矩形,cornerRadius圆角的弧度值
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 120, 200, 100) cornerRadius:30];
    path1.lineWidth = 2;
    [[UIColor blueColor] setStroke];
    [path1 stroke];
    //画左括号
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(140, 40)];
    [path2 addCurveToPoint:CGPointMake(40, 140) controlPoint1:CGPointMake(40, 40) controlPoint2:CGPointMake(140, 140)];
    [path2 addCurveToPoint:CGPointMake(140, 240) controlPoint1:CGPointMake(140, 140) controlPoint2:CGPointMake(40, 240)];
    path2.lineWidth = 2;
    [path2 stroke];
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








