//
//  TRInteger.m
//  05_有参初始化
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInteger.h"

@implementation TRInteger
-(id)initWithInteger:(int)i
{
    if (self = [super init])
    {
        self.integer = i;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d", self.integer);
}
@end
