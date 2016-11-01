//
//  TRTiger.m
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTiger.h"

@implementation TRTiger
-(void)eat:(TRFood *)food
{
    NSLog(@"老虎%@吃%@", self.name, food.name);
}
@end
