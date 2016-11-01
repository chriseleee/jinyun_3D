//
//  TRInteger.h
//  03_数组排序
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRInteger : NSObject
@property int integer;
-(id)initWithInteger:(int)integer;
-(NSComparisonResult)compareInt:(TRInteger*)other;
@end
