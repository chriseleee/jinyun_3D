//
//  PieChartView.m
//  Day02-0-Homework
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//
#import "PieChartView.h"

@interface PieChartView()
@property (nonatomic, strong) NSArray *dataArr;
@end
@implementation PieChartView
//因为每次进入drawRect方法 都要重新建字典和建数组
//虽然程序执行效果没问题，但是如果做产品的话，必须关注用户的使用体验。 尽量节省内存和Cpu的消耗
- (NSArray *)dataArr{
    if (!_dataArr) {
        NSDictionary *dic1 = @{@"color": [UIColor redColor], @"value": @0.25};
        NSDictionary *dic2 = @{@"color": [UIColor blueColor], @"value": @0.5};
        NSDictionary *dic3 = @{@"color": [UIColor blackColor], @"value": @0.15};
        NSDictionary *dic4 = @{@"color": [UIColor greenColor], @"value": @0.1};
        _dataArr = @[dic1, dic2, dic3, dic4];
    }
    return _dataArr;
}
- (void)drawRect:(CGRect)rect{
//for  forin   数组自带遍历方法
//如果在block内部更改block外部的变量值，需要在变量定义的位置 添加__block关键词
    __block CGFloat startAngel = M_PI_2*3;
    [self.dataArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
//id obj 遍历出的对象
//idx 对象索引值
//直接把block中的id类型改为dictionaray类型，称为显示转换
        
//下方为隐式转换
//        NSDictionary *dic = (NSDictionary *)obj;
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//取字典中的颜色
        UIColor *c = obj[@"color"];
//取字典中的角度
        double ang = [obj[@"value"] doubleValue];
        [path addArcWithCenter:center radius:100 startAngle:startAngel endAngle:startAngel + ang*M_PI*2 clockwise:YES];
//把转过的角度 添加到起始弧度
        startAngel += ang*M_PI*2;
        path.lineWidth = 5;
        path.lineCapStyle = kCGLineCapButt;
//把扇形直线加上，否则填充区域不确定
        [path addLineToPoint:center];
        [c setFill];
        [path fill];
    }];
}


@end










