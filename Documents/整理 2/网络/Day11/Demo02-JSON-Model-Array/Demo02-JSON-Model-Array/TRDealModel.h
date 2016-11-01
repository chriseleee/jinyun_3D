//
//  TRDealModel.h
//  Demo02-JSON-Model-Array
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDealModel : NSObject

@property (nonatomic, strong) NSString *dealID;
@property (nonatomic, strong) NSString *dealTitle;
@property (nonatomic, strong) NSNumber *listPrice;
@property (nonatomic, strong) NSNumber *currentPrice;

//解析的方法
+ (id)parseDealJSON:(NSDictionary *)jsonDic;








@end
