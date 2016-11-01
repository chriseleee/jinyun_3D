//
//  TREdit.m
//  02_组合
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TREdit.h"

@implementation TREdit
-(id)init
{
    if (self = [super init])
    {
        NSLog(@"编辑框被创建了");
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"编辑框被销毁了");
}
@end
