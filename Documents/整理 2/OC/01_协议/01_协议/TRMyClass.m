//
//  TRMyClass.m
//  01_协议
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass.h"

@implementation TRMyClass
@synthesize content = _content;//实现协议中的属性的setter/getter方法
-(void)show//实现协议中定义的方法
{
    NSLog(@"协议中的方法");
    NSLog(@"%@", self.content);
}
-(void)option//它是可有可无的
{
    NSLog(@"协议中可选的方法");
    NSLog(@"%@", self.content);
}
-(void)method//类中自有的方法
{
    NSLog(@"非协议中的方法");
}
@end
