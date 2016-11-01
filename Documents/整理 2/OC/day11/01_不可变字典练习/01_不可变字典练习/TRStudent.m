//
//  TRStudent.m
//  01_不可变字典练习
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andName:(NSString *)name andBook:(TRBook *)book
{
    if (self = [super init])
    {
        self.age = age;
        self.name = name;
        self.book = book;
    }
    return self;
}
-(void)print:(id)condition
{
    BOOL a = [condition isKindOfClass:[NSNumber class]];
    BOOL b = NO;
    if (a)
    {
        b = [condition intValue] == self.age;
    }
    BOOL c = [condition isKindOfClass:[NSString class]];
    BOOL d = NO;
    if (c)
    {
        d = [self.name isEqualToString:condition];
    }
    if (b || d)
    {
        NSLog(@"%@", self);
    }
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"stu name:%@,age:%d", self.name, self.age];
}
@end
