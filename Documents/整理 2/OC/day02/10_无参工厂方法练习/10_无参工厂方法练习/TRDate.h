//
//  TRDate.h
//  10_无参工厂方法练习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDate : NSObject
@property int year, month, day;
-(void)show;
+(id)date;
@end
