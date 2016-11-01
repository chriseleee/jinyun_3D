//
//  TRDealModel.m
//  Demo02-JSON-Model-Array
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDealModel.h"

@implementation TRDealModel

+(id)parseDealJSON:(NSDictionary *)jsonDic {
    return [[self alloc] initWithJSON:jsonDic];
}

- (id)initWithJSON:(NSDictionary *)jsonDic {
    if (self = [super init]) {
        //解析
        self.dealID = jsonDic[@"deal_id"];
        self.dealTitle = jsonDic[@"title"];
        self.currentPrice = jsonDic[@"current_price"];
        self.listPrice = jsonDic[@"list_price"];
        
    }
    
    return self;
}










@end
