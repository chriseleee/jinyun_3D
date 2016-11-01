//
//  TRWeatherModel.h
//  Demo01-JSON-Model
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWeatherModel : NSObject

//经纬度
@property (nonatomic, strong) NSNumber *lon;
@property (nonatomic, strong) NSNumber *lat;



//接口API/方法
+ (id)weatherWithJSON:(NSDictionary *)jsonDic;











@end
