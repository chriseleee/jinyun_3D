//
//  TRMyClass.m
//  03_Block
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass.h"

@implementation TRMyClass
-(void)method:(myBlock5)b
{
    NSLog(@"形参是Block");
    b();
}
-(void)method1:(myBlock6)b
{
    NSLog(@"result=%d", b(1, 2));
}
-(myBlock5)getBlock
{
    myBlock5 b = ^
    {
        NSLog(@"Block作为方法返回值");
    };
    return b;
}
@end
