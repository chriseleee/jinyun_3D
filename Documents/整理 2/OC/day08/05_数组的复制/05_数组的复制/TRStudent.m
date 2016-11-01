//
//  TRStudent.m
//  05_数组的复制
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
-(NSString *)description
{
    return [NSString stringWithFormat:@"ID:%d  name:%@", self.ID, self.name];
}
-(id)copyWithZone:(NSZone *)zone
{
    TRStudent *stu = [[TRStudent allocWithZone:zone] initWithID:self.ID andName:self.name];
    return stu;
}
@end
