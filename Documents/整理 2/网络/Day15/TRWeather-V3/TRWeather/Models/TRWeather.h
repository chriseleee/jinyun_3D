//
//  TRWeather.h
//  TRWeather
//
//  Created by tarena on 15/9/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWeather : NSObject

//时间点
@property (nonatomic , strong) NSString *time;

//当前时间点温度
@property (nonatomic, strong) NSString *tempC;

//当前时间点的图片url
@property (nonatomic, strong) NSString *iconUrl;

//下面是针对每天的属性
//日期
@property (nonatomic, strong) NSString *date;

//最高温度
@property (nonatomic, strong) NSString *maxtempC;

//最低温度
@property (nonatomic, strong) NSString *mintempC;

//头部视图的属性
//城市名字
@property (nonatomic, strong) NSString *cityName;

//天气描述
@property (nonatomic, strong) NSString *weatherDesc;


//解析每个小时的类方法
+ (id)weatherWithHourlyJSON:(NSDictionary *)hourlyDic;

//解析每天的类方法
+ (id)weatherWithDailyJSON:(NSDictionary *)dailyDic;

//解析头部视图数据的类方法
+ (id)weatherWithHeaderJSON:(NSDictionary *)headerDic;


















@end
