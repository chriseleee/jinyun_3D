//
//  TRHead.m
//  03_组合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHead.h"

@implementation TRHead
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"头被生成");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"头死亡");
}
@end
