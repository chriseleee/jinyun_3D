//
//  TRImageCenter.m
//  Demo01-Review
//
//  Created by tarena on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRImageCenter.h"

@implementation TRImageCenter

+ (id)sharedImageCenter {
    static TRImageCenter *imageCenter = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //初始化对象
        imageCenter = [[TRImageCenter alloc] init];
        //初始化可变字典
    });
    
    return imageCenter;
}
//重写了init方法
- (id)init {
    if (self = [super init]) {
        //初始化可变字典
        self.cacheImagesDic = [NSMutableDictionary dictionary];
    }
    return self;
}






@end
