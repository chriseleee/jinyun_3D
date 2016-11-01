//
//  main.m
//  03_ARC
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"


void test1()
{
    TRPoint *p = [TRPoint pointWithX:10 andY:20];
    [p show];
    //[p release];//在ARC中不允许写release，ARC会自动添加它
}//在此处，自动添加[p release]

void test2()
{
    TRPoint *p1 = nil;
    {
        TRPoint *p2 = [[TRPoint alloc] initWithX:30 andY:40];
        [p2 show];
        p1 = p2;
        //[p1 retain];//在ARC中不能使用retain方法，ARC会此处自动添加
    }//ARC自动添加[p2 release]
}//ARC自动添加[p1 release]


void test3()
{
    TRPoint *p1 = [[TRPoint alloc] initWithX:50 andY:60];
    {
        TRPoint *p2 = [[TRPoint alloc]initWithX:70 andY:80];
        //[p1 release];//ARC自动添加
        p1 = p2;
        //[p2 retain];//ARC自动添加
    }//ARC自动添加[p2 release];
}//ARC自动添加[p1 release];

void test4()
{
    //@autoreleasepool
    {
        __strong TRPoint *p = [TRPoint pointWithX:90 andY:100];
        [p show];//__strong 是强引用，它是默认的方式
    }//ARC自动添加[p release];
}

void test5()
{
    __weak TRPoint *p1 = nil;//__weak将指针p1定义为弱引用
    @autoreleasepool
    {
        TRPoint *p2 = [TRPoint pointWithX:110 andY:120];
        [p2 show];
        p1 = p2;//由于p1是弱引用，所以ARC不会自动添加[p1 retain]
        NSLog(@"p1:%p", p1);
        [p1 show];
    }//ARC自动添加[p2 release],由于p1是弱引用，所以此处还会添加p1 = nil;
    NSLog(@"---------");
    NSLog(@"p1:%@", p1);
}

void test6()
{
    TRPoint *p1 = [[TRPoint alloc]initWithX:10 andY:20];
    __weak TRPoint *p2 = p1;
    //[p1 release];//ARC自动添加
    p1 = [[TRPoint alloc] initWithX:20 andY:30];//ARC自动添加p2=nil
    NSLog(@"p2:%p", p2);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        test6();
        NSLog(@"Hello, World!");
    }
    return 0;
}
