//
//  TRStudent.m
//  04_数组排序练习
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithID:(int)ID andName:(NSString *)name
{
    if (self = [super init])
    {
        self.ID = ID;
        self.name = name;
    }
    return self;
}
-(NSComparisonResult)compareID:(TRStudent *)other
{
    if (self.ID < other.ID)
        return NSOrderedAscending;
    else if (self.ID > other.ID)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
-(NSComparisonResult)compareName:(TRStudent*)other
{
    return [self.name compare:other.name];
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"ID:%d  姓名:%@", self.ID, self.name];
}
@end
