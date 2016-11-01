//
//  TRStudent.h
//  04_数组排序练习
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRStudent : NSObject
@property int ID;
@property NSString *name;
-(id)initWithID:(int)ID andName:(NSString*)name;
-(NSComparisonResult)compareID:(TRStudent*)other;
@end
