//
//  MyView.m
//  Day03-3-DrawOnce
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@interface MyView()
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation MyView
//实现可以连续绘画， 不让画笔每次touchBegin时都重新初始化
- (UIBezierPath *)path
{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

- (void)drawRect:(CGRect)rect{
    [[UIColor redColor] setStroke];
    self.path.lineWidth=20;
    [self.path stroke];
}
//触摸开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//NSSet 和 NSArray区别
//NSSet 内容是无序,不可重复的,存储效率高
//NSArray  内容是有序，可以重复
//NSSet的用途之一就是把数组内容转化为NSSet,进行元素去重操作
//当触点之后一个时，touches中自由一个对象
//取出任意一个对象，即可获取到触点的坐标
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
//把画笔移动到这个坐标，准备开始画画
//    _path = [UIBezierPath bezierPath];
    
    [self.path moveToPoint:location];
}
//触摸移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    [self.path addLineToPoint:location];
    [self setNeedsDisplay]; //重绘
}
//触摸的结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}


@end












