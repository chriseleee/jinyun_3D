//
//  MyView.m
//  Day02-3-DrawImage
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView
- (void)drawRect:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"icon80"];
//以下两行代码可以省略不写...
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
//按照path勾勒的路径，将该区域以外的部分设置为绘制无效区域
    [path addClip];
//以上两行代码可以省略不写...
    [image drawInRect:CGRectMake(10, 10, 80, 80)];
    
}

@end







