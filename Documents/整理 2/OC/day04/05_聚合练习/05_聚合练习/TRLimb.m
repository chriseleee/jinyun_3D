//
//  TRLimb.m
//  03_组合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRLimb.h"

@implementation TRLimb
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"四肢被生成");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"四肢死亡");
}
@end
