//
//  Area.m
//  Day12-1-HomeWork-TableTree
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Area.h"

@implementation Area
- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}
+ (Area *)demoData{
    Area *a0 = [[Area alloc] initWithName:@"城市"];
    Area *a1 = [[Area alloc] initWithName:@"北京"];
    Area *a2 = [[Area alloc] initWithName:@"上海"];
    
    Area *a11 = [[Area alloc] initWithName:@"东城"];
    Area *a12 = [[Area alloc] initWithName:@"西城"];
    Area *a13 = [[Area alloc] initWithName:@"朝阳"];
    Area *a14 = [[Area alloc] initWithName:@"徐汇"];
    Area *a15 = [[Area alloc] initWithName:@"静安"];
    
    Area *a21 =[[Area alloc]initWithName:@"潘家园"];
    Area *a22 =[[Area alloc]initWithName:@"松榆路"];
    Area *a23 =[[Area alloc]initWithName:@"麦当劳"];
    
    Area *a31 =[[Area alloc]initWithName:@"建业苑"];
    
    Area *a41 =[[Area alloc]initWithName:@"一楼"];
    Area *a42 =[[Area alloc]initWithName:@"六楼"];
    
    Area *a51 =[[Area alloc]initWithName:@"达内"];
    
    Area*a61=[[Area alloc]initWithName:@"第一教室"];
    Area*a62=[[Area alloc]initWithName:@"第二教室"];
    
    a51.subAreas = @[a61, a62];
    a42.subAreas = @[a51];
    a31.subAreas = @[a41, a42];
    a22.subAreas = @[a31];
    a13.subAreas = @[a21, a22, a23];
    a1.subAreas = @[a11, a12, a13];
    a2.subAreas = @[a14, a15];
    a0.subAreas = @[a1, a2];
    return a0;
}
@end










