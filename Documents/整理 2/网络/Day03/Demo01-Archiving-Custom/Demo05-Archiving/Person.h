//
//  Person.h
//  Demo05-Archiving
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;


//接口：初始化名字和年龄
- (id)initWithName:(NSString *)name withAge:(NSInteger)age;

@end
