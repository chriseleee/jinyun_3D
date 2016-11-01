//
//  TRMetaDataTool.m
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMetaDataTool.h"
#import "TRSort.h"
#import "TRCity.h"
#import "TRCategory.h"

@implementation TRMetaDataTool
/**
 方式："单例"
 1.从plist文件中读取数据 (bundle) -> NSDictionary
 2.循环解析从plist文件中读取的数据(数组) -> TRSort
 3.将解析好所有模型对象存储到数组中，并返回
 */

static NSArray *_sorts;
+ (NSArray *)sorts {
    if (!_sorts) {
        _sorts = [[self alloc] getAndParseSortsFile:@"sorts.plist"];
    }
    return _sorts;
}

- (NSArray *)getAndParseSortsFile:(NSString *)fileName {
    
    //1.从fileName读取数据
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *sortsArray = [NSArray arrayWithContentsOfFile:filePath];
    
    //2.循环解析
    NSMutableArray *sortsMutableArray = [NSMutableArray array];
    for (NSDictionary *sortDic in sortsArray) {
        TRSort *sort = [TRSort new];
        [sort setValuesForKeysWithDictionary:sortDic];
        [sortsMutableArray addObject:sort];
    }
    
    //3.返回
    return [sortsMutableArray copy];
}

//城市
static NSArray *_cities;
+ (NSArray *)cities {
    if (!_cities) {
        _cities = [[self alloc]getAndParseCityFile:@"cities.plist"];
    }
    return _cities;
}

- (NSArray *)getAndParseCityFile:(NSString *)fileName {
    NSArray *cityArray = [self getArrayFromPlistFile:fileName];
    
    //循环解析
    NSMutableArray *cityMutableArray = [NSMutableArray array];
    for (NSDictionary *cityDic in cityArray) {
        TRCity *city = [TRCity new];
        [city setValuesForKeysWithDictionary:cityDic];
        [cityMutableArray addObject:city];
    }
    
    return [cityMutableArray copy];
}

//从plist文件中读取数据，并赋值给数组
- (NSArray *)getArrayFromPlistFile:(NSString *)fileName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    return array;
}

//分类
static NSArray *_categories;
+ (NSArray *)categories {
    if (!_categories) {
        _categories = [[self alloc] getAndParseCategoryFile:@"categories.plist"];
    }
    return _categories;
}

- (NSArray *)getAndParseCategoryFile:(NSString *)fileName {

    NSArray *array = [self getArrayFromPlistFile:fileName];
    
    //解析
    NSMutableArray *categoryMutablArray = [NSMutableArray array];
    for (NSDictionary *categoryDic in array) {
        TRCategory *category = [TRCategory new];
        [category setValuesForKeysWithDictionary:categoryDic];
        [categoryMutablArray addObject:category];
    }
    
    return [categoryMutablArray copy];
}














@end
