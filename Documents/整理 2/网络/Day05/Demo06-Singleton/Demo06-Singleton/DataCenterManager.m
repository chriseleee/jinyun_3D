//
//  DataCenterManager.m
//  Demo06-Singleton
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "DataCenterManager.h"

@implementation DataCenterManager

//static 只初始化一次
//限制：线程不安全
static DataCenterManager *_dataCenterByNormal = nil;
+ (id)sharedDataCenterByNormal {
    if (!_dataCenterByNormal) {
        [NSThread sleepForTimeInterval:1];
        _dataCenterByNormal = [[DataCenterManager alloc] init];
        
    }
    return _dataCenterByNormal;
}

//使用GCD dispatch_once
//适用场景：多线程安全
static DataCenterManager *_dataCenterByGCD = nil;
+ (id)sharedDataCenterByGCD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dataCenterByGCD = [[DataCenterManager alloc] init];
    });
    
    return _dataCenterByGCD;
}

//方式三：使用Initialize方法创建单例
static DataCenterManager *_dataCenterByInit = nil;
//重写了系统提供初始化方法(在接收到第一个消息之前)
//in thread-safe manner:线程安全的方式
+ (void)initialize {
    if (self == [DataCenterManager class]) {
        //初始化对象
        _dataCenterByInit = [[DataCenterManager alloc] init];
    }
}

+ (id)sharedDataCenterByInitialize {
    return _dataCenterByInit;
}





@end
