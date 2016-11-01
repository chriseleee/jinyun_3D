//
//  TRSingleton.m
//  03_单例模式
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRSingleton.h"

static TRSingleton* single = nil;

@implementation TRSingleton
+(id)sharedSingleton
{
    if (single == nil)
    {
        single = [[TRSingleton alloc] init];
    }
    return single;
}
@end
