//
//  main.m
//  01_协议
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMyProtocol.h"
#import "TRMyClass.h"

void test()
{
    id<TRMyProtocol> ref = [[TRMyClass alloc] init];//定义一个只能指向采纳协议TRMyProtocol的类的对象的指针ref
    ref.content = @"协议中的属性值";//为协议中的属性赋值
    [ref show];//调用协议中定义的方法
    //[ref method];//ref不能调用类中自定义的方法，只能调用协议中声明的方法
    [ref option];
}
#import "TRProtocol1.h"
#import "TRProtocol2.h"
#import "TRClassA.h"

void test1()
{
    TRClassA *obj = [[TRClassA alloc] init];
    id<TRProtocol1> id1 = obj;
    [id1 method0];
    [id1 method1];
    //[id1 method2];//不能调用Protocol2中的方法
    
    id<TRProtocol2> id2 = obj;
    [id2 method0];
    [id2 method1];
    [id2 method2];
}

#import "TRClassB.h"
void test2()
{
    TRClassB *obj = [[TRClassB alloc] init];
    id<TRProtocol1> id1 = obj;
    [id1 method0];
    [id1 method1];
//    [id1 method2];
//    [id1 method3];
//    [id1 method4];
    
    id<TRProtocol2> id2 = obj;
    [id2 method0];
    [id2 method1];
    [id2 method2];
    //    [id2 method3];
    //    [id2 method4];
    
    id<TRProtocol3> id3 = obj;
//    [id3 method0];
//    [id3 method1];
//    [id3 method2];
    [id3 method3];
//    [id3 method4];
    
    id<TRProtocol4> id4 = obj;
    [id4 method0];
    [id4 method1];
    [id4 method2];
    [id4 method3];
    [id4 method4];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
    }
    return 0;
}
