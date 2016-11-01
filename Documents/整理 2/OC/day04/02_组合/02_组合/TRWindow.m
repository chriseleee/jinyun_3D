//
//  TRWindow.m
//  02_组合
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWindow.h"

@implementation TRWindow
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"窗口被创建了");
        button = [[TRButton alloc] init];
        edit = [[TREdit alloc] init];
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"窗口被销毁了");
}
@end
