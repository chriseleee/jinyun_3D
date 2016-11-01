//
//  TRAnnotation.m
//  TRFindDeals
//
//  Created by tarena on 15/9/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnnotation.h"

@implementation TRAnnotation

//重写isEqual方法：手动设定两个大头针相等的规则(title)
//调用时机：containsObject:
- (BOOL)isEqual:(TRAnnotation *)object {
    return [self.title isEqual:object.title];
}










@end
