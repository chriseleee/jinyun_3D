//
//  TRPoint.m
//  07_self关键字
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y
{
    if (self = [super init])
    {
        [self setX:x andY:y];
    }
    return self;
}
-(void)setX:(int)x andY:(int)y
{
    self.x = x;
    self.y = y;
}
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
@end
