//
//  DataCenterManager.h
//  Demo06-Singleton
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenterManager : NSObject

//掌握
+ (id)sharedDataCenterByNormal;

//掌握:dispatch_once创建单例
+ (id)sharedDataCenterByGCD;

//了解
+ (id)sharedDataCenterByInitialize;







@end
