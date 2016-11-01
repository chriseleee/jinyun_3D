//
//  TRPoint.m
//  01_有参工厂方法
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
+(id)pointWithX:(int)x andY:(int)y
{
    TRPoint *p = [[TRPoint alloc] initWithX:x andY:y];
    return p;
}
@end
