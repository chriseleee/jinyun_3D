//
//  TRWeather.m
//  TRWeather
//
//  Created by tarena on 15/9/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWeather.h"

@implementation TRWeather

+ (id)weatherWithHourlyJSON:(NSDictionary *)hourlyDic {
    return [[self alloc] initWithHourlyJSON:hourlyDic];
}

- (id)initWithHourlyJSON:(NSDictionary *)hourlyDic {
    if (self = [super init]) {
        //解析每个小时的数据
        self.tempC = hourlyDic[@"tempC"];
        int time = [hourlyDic[@"time"] intValue] / 100;
        self.time = [NSString stringWithFormat:@"%d:00", time];
        self.iconUrl = hourlyDic[@"weatherIconUrl"][0][@"value"];
    }
    
    return self;
}
//每天的数据
+ (id)weatherWithDailyJSON:(NSDictionary *)dailyDic {
    return [[self alloc] initWithDailyJSON:dailyDic];
}

- (id)initWithDailyJSON:(NSDictionary *)dailyDic {
    if (self = [super init]) {
        self.date = dailyDic[@"date"];
        self.maxtempC = dailyDic[@"maxtempC"];
        self.mintempC = dailyDic[@"mintempC"];
        //设置图片url
        self.iconUrl = dailyDic[@"hourly"][0][@"weatherIconUrl"][0][@"value"];
    }
    
    return self;
}

//解析头部视图的数据
+ (id)weatherWithHeaderJSON:(NSDictionary *)headerDic {
    return [[self alloc] initWithHeaderJSON:headerDic];
}

- (id)initWithHeaderJSON:(NSDictionary *)headerDic {
    if (self = [super init]) {
        //6个属性
        self.cityName = headerDic[@"data"][@"request"][0][@"query"];
        self.weatherDesc = headerDic[@"data"][@"current_condition"][0][@"weatherDesc"][0][@"value"];
        self.tempC = headerDic[@"data"][@"current_condition"][0][@"temp_C"];
        self.maxtempC = headerDic[@"data"][@"weather"][0][@"maxtempC"];
        self.mintempC = headerDic[@"data"][@"weather"][0][@"mintempC"];
        self.iconUrl = headerDic[@"data"][@"current_condition"][0][@"weatherIconUrl"][0][@"value"];
    }
    
    return self;
}










@end
