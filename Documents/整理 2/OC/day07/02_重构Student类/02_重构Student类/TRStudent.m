//
//  TRStudent.m
//  02_重构Student类
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(void)printInfo
{
    NSLog(@"年龄：%d", self.age);
    NSLog(@"性别：%@", self.gender ? @"男" : @"女");
    NSLog(@"助学金:%g", self.salary);
}
-(id)copyWithZone:(NSZone *)zone
{
    TRStudent *stu = [[TRStudent allocWithZone:zone]init];
    stu.age = self.age;
    stu.gender = self.gender;
    stu.salary = self.salary;
    return stu;
}
@end
