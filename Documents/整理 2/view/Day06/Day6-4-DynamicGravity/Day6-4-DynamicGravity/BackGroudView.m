//
//  BackGroudView.m
//  Day6-4-DynamicGravity
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BackGroudView.h"

@implementation BackGroudView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
    [[UIColor redColor] setStroke];
    path.lineWidth = 3;
    [path stroke];
}


@end






