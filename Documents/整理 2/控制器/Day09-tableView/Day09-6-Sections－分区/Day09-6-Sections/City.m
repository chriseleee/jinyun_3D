//
//  City.m
//  Day09-5-City
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "City.h"

@implementation City

+ (NSArray *)cityArr{
    City *c1 = [City new];
    c1.cityName = @"北京";
    c1.areas = @[@"东城", @"西城", @"海淀", @"朝阳"];
    
    City *c2 = [City new];
    c2.cityName = @"上海";
    c2.areas = @[@"浦东", @"静安", @"徐汇", @"闵行"];
    
    City *c3 = [City new];
    c3.cityName = @"广州";
    c3.areas = @[@"白云", @"越秀", @"天河"];
    return @[c1, c2, c3];
}








@end
