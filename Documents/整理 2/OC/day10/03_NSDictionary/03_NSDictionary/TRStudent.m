//
//  TRStudent.m
//  03_NSDictionary
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
- (NSString *)description
{
    return [NSString stringWithFormat:@"stu name:%@, age:%d", self.name, self.age];
}
-(NSComparisonResult)compareName:(TRStudent *)other
{
    return [self.name compare:other.name];
}
-(NSComparisonResult)compareAge:(TRStudent *)other
{
    if (self.age < other.age) {
        return NSOrderedAscending;
    }
    else if (self.age > other.age) {
        return NSOrderedDescending;
    }
    else
        return NSOrderedSame;
}
@end
