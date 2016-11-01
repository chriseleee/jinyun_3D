//
//  TRImageCenter.h
//  Demo01-Review
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRImageCenter : NSObject

//下载图片的缓存可变字典
@property (nonatomic, strong) NSMutableDictionary *cacheImagesDic;

//创建单例的类方法
+ (id)sharedImageCenter;







@end
