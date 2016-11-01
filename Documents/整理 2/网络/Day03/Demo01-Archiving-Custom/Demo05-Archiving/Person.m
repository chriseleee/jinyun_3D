//
//  Person.m
//  Demo05-Archiving
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)name withAge:(NSInteger)age {
    
    if (self = [super init]) {
        //初始化属性
        self.name = name;
        self.age = age;
    }
    
    return self;
}

#pragma mark -- NSCoding协议方法
//归档/写
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //对自定义类所有的属性进行编码
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    
}

//反归档/读
- (id)initWithCoder:(NSCoder *)aDecoder {
    //对自定义类所有的属性进行解码
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}









@end
