//
//  TRPieChartView.m
//  Demo0_Homework_Pie_Chart
//
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPieChartView.h"
#import "TRPieChartViewItem.h"

@implementation TRPieChartView


-(NSArray *)data{
    if (!_data) {
        TRPieChartViewItem *item1 = [[TRPieChartViewItem alloc]initWithColor:[UIColor redColor] andValue:0.25];
        TRPieChartViewItem *item2 = [[TRPieChartViewItem alloc]initWithColor:[UIColor blueColor] andValue:0.5];
        TRPieChartViewItem *item3 = [[TRPieChartViewItem alloc]initWithColor:[UIColor blackColor] andValue:0.15];
        TRPieChartViewItem *item4 = [[TRPieChartViewItem alloc]initWithColor:[UIColor greenColor] andValue:0.1];
        _data = @[item1,item2,item3,item4];
    }
    return _data;
}

-(CGFloat)lineWidth{
    if (!_lineWidth) {
        _lineWidth = 10;
    }
    return _lineWidth;
}

-(CGFloat)radius{
    if (!_radius) {
        _radius = 100;
    }
    return _radius;
}

- (void)drawRect:(CGRect)rect {
    CGFloat startAngel = M_PI_2*3;
    for (TRPieChartViewItem *item in self.data) {

        UIBezierPath *path = [UIBezierPath bezierPath];
        // 画弧线
        [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.radius startAngle:startAngel endAngle:(item.value*2*M_PI+startAngel) clockwise:YES];
        startAngel +=item.value*2*M_PI;
        //画直线
        [path addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
        //线宽
        path.lineWidth = self.lineWidth;
        path.lineCapStyle = kCGLineCapButt;
        //填充色
        [item.color setFill];
        //线条颜色
        //[[UIColor grayColor] setStroke];
        //绘制填充边线
        [path fill];
        //[path stroke];

    }
}


@end
