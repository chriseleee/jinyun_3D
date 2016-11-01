//
//  MyView.m
//  Day01-6-CoreGraphics
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView
/*
 方法执行的时机:
 在创建View实例时，会自动执行一次
 该方法只是系统复杂的绘图流程中的一个环节
 千万不能手动调用
 只有在drawRect方法中，才能获取到当前绘图上下文对象
 也只有有了对象的上下文对象，才能执行绘图动作
 */
- (void)drawRect:(CGRect)rect{
//获取绘图上下文对象--理解为 创建了一个画布
    CGContextRef context = UIGraphicsGetCurrentContext();
//移动画笔到画布上的某个位置, x 40， y40 这个位置
    CGContextMoveToPoint(context, 40, 40);
//在画布上画一条竖线
    CGContextAddLineToPoint(context, 40, 140);
    CGContextAddLineToPoint(context, 140, 40);
    CGContextAddLineToPoint(context, 40, 40);
//设置描边颜色
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor] );
//设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
//开始画
    CGContextDrawPath(context, kCGPathFillStroke);
}






@end





