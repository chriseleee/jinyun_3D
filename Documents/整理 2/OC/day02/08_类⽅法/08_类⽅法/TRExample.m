//
//  TRExample.m
//  08_类⽅法
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRExample.h"

@implementation TRExample
-(void)show
{
    NSLog(@"我是一个实例方法");
}

+(void)classMethod
{
    NSLog(@"我是一个类方法");
    TRExample *e = [[TRExample alloc] init];
    e.a = 10;
    [e show];
    //[self show];//类方法中没有self的定义，所以在类方法中，不能使用self
    //self.a = 10;//类的属性在类方法中也不能使用
}
@end
