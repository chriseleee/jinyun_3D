//
//  TRMouse.m
//  04_聚合
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"鼠标被创建了");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"鼠标被销毁了");
}
@end
