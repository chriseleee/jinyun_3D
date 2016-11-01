//
//  TRAnimal.m
//  03_组合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"动物诞生");
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"动物死亡");
}
@end
