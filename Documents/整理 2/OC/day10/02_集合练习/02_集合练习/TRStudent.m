//
//  TRStudent.m
//  02_集合练习
//
//  Created by tarena on 15/7/28.
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
+(id)studentWithAge:(int)age andName:(NSString *)name andBook:(TRBook *)book
{
    return [[TRStudent alloc]initWithAge:age andName:name andBook:book];
}
-(void)print:(id)condition
{
    BOOL a = [condition isKindOfClass:[NSNumber class]];
    BOOL b = NO;
    if (a == YES)
    {
        b = [condition intValue] == self.age;
    }
    BOOL c = [condition isKindOfClass:[NSString class]];
    BOOL d = NO;
    if (c == YES)
    {
        d = [condition isEqualToString:self.name];
    }
    if ((a && b) || (c && d))
    {
        NSLog(@"%@", self);
    }
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"stu name:%@, age:%d", self.name, self.age];
}
@end
