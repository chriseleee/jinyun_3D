//
//  TRInteger.m
//  03_数组排序
//
//  Created by tarena on 15/7/24.
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
-(NSComparisonResult)compareInt:(TRInteger *)other
{
    if (self.integer > other.integer)
        return  NSOrderedAscending;//升序
    else if (self.integer < other.integer)
        return  NSOrderedDescending;//降序
    else
        return NSOrderedSame;//相等
}
-(NSString *)description
{
    //NSLog(@"%d", self.integer);
    return [NSString stringWithFormat:@"%d", self.integer];
}
@end
