//
//  TRBusiness.h
//  TRFindDeals
//
//  Created by tarena on 15/9/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRBusiness : NSObject
@property (nonatomic, strong) NSString *name;
//id特殊，不需要重写setUndefinedKey方法
@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *h5_url;














@end
