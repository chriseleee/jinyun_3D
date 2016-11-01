//
//  TRStudent.h
//  01_数组练习
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBook.h"

@interface TRStudent : NSObject
@property NSString *name;
@property int age;
@property (copy) TRBook *book;

-(id)initWithAge:(int)age andName:(NSString*)name andBook:(TRBook*)book;
+(id)studentWithAge:(int)age andName:(NSString*)name andBook:(TRBook*)book;
-(void)print:(id)condition;
@end
