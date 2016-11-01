//
//  TRHippo.m
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHippo.h"

@implementation TRHippo
-(void)eat:(TRFood *)food
{
    NSLog(@"河马%@慢慢地吃%@", self.name, food.name);
}
@end
