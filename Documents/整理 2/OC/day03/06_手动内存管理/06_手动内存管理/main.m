//
//  main.m
//  06_手动内存管理
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

void test1()
{
    TRPoint *p = [[TRPoint alloc] initWithX:10 andY:20];
    NSLog(@"%lu", (unsigned long)[p retainCount]);
    [p show];
    [p release];//相当于C中的free，此时p指向的空间被释放，变成无主空间，那么，指向无主空间的指针p被称为野指针
    p = nil;//释放后应养成马上将指针赋空的习惯，指针值为nil时，被称为空指针
    [p show];
    NSLog(@"%lu", (unsigned long)[p retainCount]);//因为p指向的空间已经在17行被释放，所以是无主的空间，retainCount得到的计数器值是随机数
}

void test2()
{
    TRPoint *p = [[TRPoint alloc] initWithX:10 andY:20];
    NSLog(@"%lu", (unsigned long)[p retainCount]);
    TRPoint *p1 = p;
    NSLog(@"%lu", (unsigned long)[p1 retainCount]);
    [p retain];
    NSLog(@"%lu", (unsigned long)[p1 retainCount]);

    [p1 release];
    NSLog(@"%lu", (unsigned long)[p1 retainCount]);
    [p release];
    NSLog(@"%lu", (unsigned long)[p1 retainCount]);

//    [p1 retain];//在没有新增指针的情况下，不要调用retain方法，以防止产生混乱
//    NSLog(@"%lu", (unsigned long)[p1 retainCount]);
//    [p release];
}
#import "TRCircle.h"

void test3()
{
    TRPoint *p = [[TRPoint alloc] initWithX:10 andY:20];//指针变量p指向点对象
    NSLog(@"%ld", [p retainCount]);
    TRCircle *circle = [[TRCircle alloc] initWithCenter:p andRadius:5];//circle.center指针也指向点对象，但没有调用retain使引用计数器加1
    NSLog(@"%ld", [p retainCount]);
    [p release];//点对象被释放
    NSLog(@"%ld", [p retainCount]);
    [circle show];//此时circle.center为野指针
    [circle release];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test3();
    }
    return 0;
}
