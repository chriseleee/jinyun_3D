//
//  TRPoint.m
//  05_单例模式练习2
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

static TRPoint *point = nil;

@implementation TRPoint
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
+(id)sharedPoint
{
    if (point == nil)
    {
        point = [[TRPoint alloc] init];
    }
    return point;
}
@end
