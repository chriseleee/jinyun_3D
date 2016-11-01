//
//  TRComputer.m
//  04_聚合
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRComputer.h"

@implementation TRComputer
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"计算机被创建了");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"计算机被销毁了");
}
@end
