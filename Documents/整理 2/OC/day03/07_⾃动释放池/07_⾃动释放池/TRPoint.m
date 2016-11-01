//
//  TRPoint.m
//  07_⾃动释放池
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y
{
    if(self = [super init])
    {
        self.x = x;
        self.y = y;
    }
    return self;
}
+(id)pointWithX:(int)x andY:(int)y
{
    return [[[TRPoint alloc]initWithX:x andY:y] autorelease];
}
-(void)dealloc
{
    NSLog(@"%@被销毁", self);
    [super dealloc];
}
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
@end
