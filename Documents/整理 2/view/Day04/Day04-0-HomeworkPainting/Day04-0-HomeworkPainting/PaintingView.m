//
//  PaintingView.m
//  Day04-0-HomeworkPainting
//
//  Created by tarena on 15/8/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PaintingView.h"
#import "DrawPath.h"
//.m中声明的属性 是不公开的，外界无法访问的。更安全。
//我们通常只把需要通知外界 或者是 从外界获取资源的 属性，写在.h中。
@interface PaintingView()
//用于存放 每个矩形的 相关属性
@property (nonatomic, strong) NSMutableArray *allPaths;
//当前所画的矩形的起点
@property(nonatomic) CGPoint startPoint;

@end

@implementation PaintingView
- (NSMutableArray *)allPaths{
    if (!_allPaths) {
        _allPaths = [NSMutableArray array];
    }
    return _allPaths;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//获得起点
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
//创建贝塞尔路径进行矩形的画的准备工作
//创建自定义的路径对象
    DrawPath *p = [DrawPath new];
    p.setting = [Setting new];
//判断当前是否是 橡皮模式
//是橡皮模式，需要画直线，线的颜色与当前视图背景色一致
//不是橡皮模式，画矩形
    if (self.currentSetting.rubber) {
        p.path = [UIBezierPath bezierPath];
        [p.path moveToPoint:self.startPoint];
        p.setting.lineWidth = 7;
        p.setting.lineColor = self.backgroundColor;
    }else{
        p.setting.lineWidth = self.currentSetting.lineWidth;
        p.setting.lineColor = self.currentSetting.lineColor;
    }
    [self.allPaths addObject:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
//从数组中取得最后一个对象，即当前画线操作的对象
    DrawPath *p = [self.allPaths lastObject];
//橡皮:画线   非橡皮模式:画矩形
    if (self.currentSetting.rubber) {
        [p.path addLineToPoint:endPoint];
    }else{
        p.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.startPoint.x, self.startPoint.y, endPoint.x - self.startPoint.x, endPoint.y - self.startPoint.y)];
    }
    [self setNeedsDisplay]; //重绘
}
- (void)drawRect:(CGRect)rect {
    for (DrawPath *p in self.allPaths) {
        
        p.path.lineWidth = p.setting.lineWidth;
        [p.setting.lineColor setStroke];
        [p.path stroke];
    }
}


@end
