//
//  TRTrunk.m
//  03_组合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTrunk.h"

@implementation TRTrunk
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"躯干被生成");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"躯干死亡");
}
@end
