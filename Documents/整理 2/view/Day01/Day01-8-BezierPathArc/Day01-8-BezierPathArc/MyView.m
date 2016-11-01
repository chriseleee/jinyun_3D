//
//  MyView.m
//  Day01-8-BezierPathArc
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"
@implementation MyView
- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
//画 1/4  圆
//center 圆心
//radius 半径
//startAngle 起始弧度
//endAngle 结束弧度
//clockwise 是否顺时针
    [path addArcWithCenter:CGPointMake(160, 200) radius:80 startAngle:M_PI_2*3 endAngle:M_PI*2 clockwise:YES];
    path.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [path stroke];
}
@end










