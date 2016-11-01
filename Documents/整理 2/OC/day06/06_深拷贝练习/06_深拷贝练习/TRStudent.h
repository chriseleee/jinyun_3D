//
//  TRStudent.h
//  06_深拷贝练习
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBook.h"

@interface TRStudent : NSObject
@property int age;
@property (copy) TRBook *book;
-(void)study;
@end
