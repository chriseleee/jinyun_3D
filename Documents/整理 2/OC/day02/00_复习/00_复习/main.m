//
//  main.m
//  00_复习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyFirstClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        NSLog(@"Hello World!");
        
        int x = 10;
        double d = 3.14;
        NSLog(@"x=%d, d=%g", x, d);
        
        //C语言中的字符串，在OC中不再使用
        char *str = "This is a string";
        NSLog(@"%s", str);
        //OC中的字符串
        NSString *str1 = @"This is a OC string.";//NSString是OC中事先定义好的一个类，直接可以使用
        NSLog(@"%@", str1);
        NSString *str2 = str1;
        NSLog(@"%@", str2);
        
        //OC中的布尔类型
        BOOL b;
        b = YES;
        b = NO;
        //C语言中的布尔类型，在OC中不再使用
        bool b1;
        b1 = true;
        b1 = false;
        
        struct MyStruct a;//a是一个局部变量，被放在栈区
        //MyFirstClass a1;//类不能定义局部变量，即不能放到栈区
        
        struct MyStruct *p = (struct MyStruct*)malloc(sizeof(struct MyStruct));//定义一个堆上的结构体变量
        MyFirstClass *mfc = [MyFirstClass alloc];//只能定义放在堆上的类的变量
        
        p->i = 10;//结构体的成员变量，可以直接访问
        p->ch = 'a';
        p->d = 3.14;
        //mfc->_i = 20;//直接使用类的指针访问类中的成员变量，是不允许的
        [mfc method];//调用类中的函数
        
        mfc.i = 20;//由于有@property, 所以此行语句可以替代52行
        //[mfc setI:10];//完成对类中变量_i的赋值
        NSLog(@"i=%d", mfc.i);//此行替代54行
        //NSLog(@"i=%d", [mfc i]);//完成对类中变量_i的取值
    }
    return 0;
}
