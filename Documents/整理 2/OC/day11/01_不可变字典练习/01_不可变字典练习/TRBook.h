//
//  TRBoo.h
//  01_不可变字典练习
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRBook : NSObject<NSCopying>
@property NSString *name;
@property int price;
@end
