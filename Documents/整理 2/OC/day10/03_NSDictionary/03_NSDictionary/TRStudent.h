//
//  TRStudent.h
//  03_NSDictionary
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property NSString *name;
@property int age;
-(NSComparisonResult)compareName:(TRStudent*)other;
-(NSComparisonResult)compareAge:(TRStudent *)other;
@end
