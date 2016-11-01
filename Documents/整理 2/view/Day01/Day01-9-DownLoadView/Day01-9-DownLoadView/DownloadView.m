//
//  DownloadView.m
//  Day01-9-DownLoadView
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DownloadView.h"

@implementation DownloadView
//监视progressValue的更改，当发生变化的时候，就要刷新界面
//progressValue的更改只有一种方式，就是被调用了set方法
//所以我们只要重写它的set方法，就可以监控每一次更改
- (void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
//刷新界面
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
//中心点的位置应该宽的一半，高的一半
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
//半径， 宽和高中取最短的 减掉 10
//系统提供了 宏定义的方法 MIN(a,b) 来取两者中的最小值
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2 - 10;
    [path addArcWithCenter:center radius:radius startAngle:3 *M_PI_2 endAngle:3*M_PI_2 + 2*M_PI *_progressValue clockwise:YES];
    path.lineWidth = 8;
//判断是否有被设置自定义的颜色，如果没有，则默认为蓝色
    if (_progressColor == nil) {
        [[UIColor blueColor] setStroke];
    }else{
        [_progressColor setStroke];
    }
    
    [path stroke];
}
@end










