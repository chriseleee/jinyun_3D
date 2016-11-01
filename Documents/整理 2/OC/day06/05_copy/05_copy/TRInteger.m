//
//  TRInteger.m
//  05_copy
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInteger.h"

@implementation TRInteger
-(id)initWithInteger:(int)integer
{
    if (self = [super init])
    {
        self.integer = integer;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d", self.integer);
}
-(id)copyWithZone:(NSZone*)zone//此方法被copy方法调用，不能在主函数中直接调用
{
    TRInteger *i = [[TRInteger allocWithZone:zone] initWithInteger:self.integer];
    return i;
}
@end
