//
//  TRButton.m
//  02_组合
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRButton.h"

@implementation TRButton
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"按钮被创建了");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"按钮被销毁了");
}
@end
