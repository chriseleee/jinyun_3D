//
//  TRPoint.m
//  06_手动内存管理
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y
{
    if (self = [super init])
    {
        self.x = x;
        self.y = y;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
-(void)dealloc
{
    NSLog(@"%@被销毁了", self);
    [super dealloc];
}
@end
