//
//  TRDate.h
//  02_有参工厂方法练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDate : NSObject
@property int year, month, day;
-(id)initWithYear:(int)year andMonth:(int)month andDay:(int)day;
-(void)show;
+(id)dateWithYear:(int)year andMonth:(int)month andDay:(int)day;
@end
