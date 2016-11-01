//
//  TRWeatherModel.m
//  Demo01-JSON-Model
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWeatherModel.h"

@implementation TRWeatherModel

+ (id)weatherWithJSON:(NSDictionary *)jsonDic {
    return [[self alloc] initWithJSON:jsonDic
            ];
}

- (id)initWithJSON:(NSDictionary *)jsonDic {
    if (self = [super init]) {
        //解析的逻辑
        //经纬度
        NSDictionary *coordDic = jsonDic[@"coord"];
        self.lon = coordDic[@"lon"];
        self.lat = coordDic[@"lat"];
    }
    
    return self;
    
}








@end
