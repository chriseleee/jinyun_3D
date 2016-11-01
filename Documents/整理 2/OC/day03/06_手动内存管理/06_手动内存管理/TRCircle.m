//
//  TRCircle.m
//  06_手动内存管理
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCircle.h"

@implementation TRCircle
-(id)initWithCenter:(TRPoint *)center andRadius:(double)radius
{
    if (self = [super init])
    {
        self.center = center;
        //[self setCenter:center];
        self.radius = radius;
    }
    return  self;
}

/*
 -(void)setCenter:(TRPoint*)center
 {
    _center = center;
 }
 */
-(void)show
{
    NSLog(@"圆心(%d,%d),半径%g", self.center.x, self.center.y, self.radius);
}
-(void)dealloc
{
    [self.center release];
    NSLog(@"%@被销毁了", self);
    [super dealloc];
}
@end
