//
//  TRDate.m
//  01_方法
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDate.h"

@implementation TRDate
-(void)print
{
    NSLog(@"%d-%d-%d", self.year, self.month, self.day);
}

-(int)days//不能在类外使用
{
    int days = 0;
    for (int i = 1; i < self.month; i++)
    {
        switch (i)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                days += 31;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                days += 30;
                break;
            case 2:
                days += 28 + self.year % 400 == 0 || (self.year % 4 == 0 && self.year % 100 != 0);
                break;
        }
    }
    days += self.day;
    return days;
}

-(void)printDays
{
    NSLog(@"今年已经过了%d天", [self days]);
}
@end
