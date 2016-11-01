//
//  TRPoint.m
//  09_无参⼯⼚⽅法
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)init
{
    if (self = [super init])
    {
        self.x = 30;
        self.y = 80;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d,%d", self.x, self.y);
}
+(id)point
{
    TRPoint *p = [[TRPoint alloc] init];
    return p;
}
@end
