//
//  TRStudent.h
//  01_不可变字典练习
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBook.h"

@interface TRStudent : NSObject
@property int age;
@property NSString *name;
@property (copy) TRBook *book;
-(id)initWithAge:(int)age andName:(NSString*)name andBook:(TRBook*)book;
-(void)print:(id)condition;
@end
