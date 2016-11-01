//
//  TRDate.m
//  02_有参工厂方法练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDate.h"

@implementation TRDate
-(id)initWithYear:(int)year andMonth:(int)month andDay:(int)day
{
    if (self = [super init])
    {
        self.year = year;
        self.month = month;
        self.day = day;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d-%d-%d", self.year, self.month, self.day);
}
+(id)dateWithYear:(int)year andMonth:(int)month andDay:(int)day
{
    TRDate *d = [[TRDate alloc] initWithYear:year andMonth:month andDay:day];
    return d;
}
@end
