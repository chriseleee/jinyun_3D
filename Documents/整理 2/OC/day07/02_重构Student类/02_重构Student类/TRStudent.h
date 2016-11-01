//
//  TRStudent.h
//  02_重构Student类
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject<NSCopying>
@property int age;
@property BOOL gender;
@property double salary;
-(void)printInfo;
@end
