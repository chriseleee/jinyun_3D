//
//  TRMetaDataTool.h
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMetaDataTool : NSObject

//排序数据(返回所有排序模型对象)
+ (NSArray *)sorts;

//城市数据
+ (NSArray *)cities;

//分类数据
+ (NSArray *)categories;

//根据传入的城市，返回该城市对应的所有区域和子区域
+ (NSArray *)regionsWithCityName:(NSString *)cityName;









@end
