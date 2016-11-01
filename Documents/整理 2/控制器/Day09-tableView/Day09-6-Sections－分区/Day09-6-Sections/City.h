//
//  City.h
//  Day09-5-City
//
//  Created by tarena on 15/8/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSArray *areas;

+ (NSArray *)cityArr;
@end









