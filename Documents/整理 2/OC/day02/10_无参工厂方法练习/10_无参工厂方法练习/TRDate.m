//
//  TRDate.m
//  10_无参工厂方法练习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDate.h"

@implementation TRDate
-(id)init
{
    if (self = [super init])
    {
        self.year = 2015;
        self.month = 7;
        self.day = 16;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d-%d-%d", self.year, self.month, self.day);
}
+(id)date
{
    TRDate *d = [[TRDate alloc] init];
    return d;
}
@end
