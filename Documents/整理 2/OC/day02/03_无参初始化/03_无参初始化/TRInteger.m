//
//  TRInteger.m
//  03_无参初始化
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInteger.h"

@implementation TRInteger
-(id)init
{
    if (self = [super init])
    {
        self.integer = 20;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d", self.integer);
}
@end
