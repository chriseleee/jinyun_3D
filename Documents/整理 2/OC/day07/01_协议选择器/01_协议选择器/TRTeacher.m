//
//  TRTeacher.m
//  01_协议选择器
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTeacher.h"

@implementation TRTeacher
-(id)copyWithZone:(NSZone *)zone
{
    TRTeacher *t = [[TRTeacher allocWithZone:zone]init];
    t.name = self.name;
    t.course = self.course;
    return t;
}
@end
