//
//  TRPoint.m
//  04_无参初始化练习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)init
{
    if (self = [super init])
    {
        self.x = 10;
        self.y = 20;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
@end
