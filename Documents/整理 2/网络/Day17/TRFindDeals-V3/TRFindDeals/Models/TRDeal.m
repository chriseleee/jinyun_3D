//
//  TRDeal.m
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDeal.h"

@implementation TRDeal

//重写方法 ---》将字典中description关键字和属性中desc绑定
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
    
}










@end
