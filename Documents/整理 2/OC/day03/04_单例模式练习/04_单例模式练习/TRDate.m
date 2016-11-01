//
//  TRDate.m
//  04_单例模式练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDate.h"

static TRDate* date = nil;

@implementation TRDate
-(void)show
{
    NSLog(@"%d-%d-%d", self.year, self.month, self.day);
}
+(id)sharedDate
{
    if (date == nil)
    {
        date = [[TRDate alloc]init];
    }
    return date;
}
@end
