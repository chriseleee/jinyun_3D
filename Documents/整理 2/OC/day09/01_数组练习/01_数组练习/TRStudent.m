//
//  TRStudent.m
//  01_数组练习
//
//  Created by tarena on 15/7/27.
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
    return [[TRStudent alloc] initWithAge:age andName:name andBook:book];
}
-(void)print:(id)condition
{
    BOOL a = [condition isKindOfClass:[NSNumber class]];//condition是否为NSNumber 类的对象
    BOOL b = [condition intValue] == self.age;//如果condition对象是NSNumber类的对象，则拆封，并判断与当前调用print方法的对象的年龄属性是否相同
    BOOL c = [condition isKindOfClass:[NSString class]];//condition是否为NSString类的对象
    BOOL d = [self.name isEqualToString:condition];//如果condition是NSString类的对象，判断该对象与当前调用print方法的对象的姓名属性是否相同
    if ((a && b) || (c && d))//a&&b代表条件是年龄为18岁，c&&d代表名字为张三
    {
        NSLog(@"stu name:%@,age:%d", self.name, self.age);
    }
}
@end
