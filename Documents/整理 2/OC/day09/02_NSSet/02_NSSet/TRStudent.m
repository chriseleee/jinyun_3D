//
//  TRStudent.m
//  02_NSSet
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithName:(NSString *)name andAge:(int)age
{
    if (self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}
+(id)studentWithName:(NSString *)name andAge:(int)age
{
    return [[TRStudent alloc]initWithName:name andAge:age];
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"stu name:%@, age:%d", self.name, self.age];
}
-(NSUInteger)hash//粗略排除重复元素
{
    return self.age;
}
-(BOOL)isEqual:(id)object//精确排除重复元素
{
    if (self == object)
    {
        return YES;              
    }
    if ([object isMemberOfClass:[TRStudent class]] == YES)
    {
        TRStudent *stu = object;
        if ([self.name isEqualToString:stu.name] && self.age == stu.age)
            return YES;
    }
    return NO;
}
@end
