//
//  TRPoint.m
//  03_ARC
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
-(id)initWithX:(int)x andY:(int)y
{
    if (self = [super init])
    {
        self.x = x;
        self.y = y;
    }
    return self;
}
+(id)pointWithX:(int)x andY:(int)y
{
    return [[TRPoint alloc] initWithX:x andY:y];
}
@end
