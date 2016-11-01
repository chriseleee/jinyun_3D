//
//  TRDate.h
//  04_单例模式练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRDate : NSObject
@property int year, month, day;
-(void)show;
+(id)sharedDate;
@end
