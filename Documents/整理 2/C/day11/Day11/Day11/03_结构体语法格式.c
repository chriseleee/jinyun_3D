//
//  03_结构体语法格式.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a1;//int是C语言提供的一种数据类型
    a1 = 10;
    struct exam//结构体是程序员自己创造的一种数据类型
    {
        int i;//变量i是结构体exam的一个成员
        char ch;
        double d;
    };
    struct exam a;//struct exam就是一种数据类型，可以用来定义变量a
    a.i = 10;//结构体成员只能单个使用
    a.ch = 'a';
    a.d = 3.14;
    
    struct Parter
    {
        char name[100];
        double price;
        int count;
    };
    struct Parter b;
    
    //创建一个结构体，用于管理学生信息，学号、姓名、性别、年龄
    struct stuInfo
    {
        int ID;
        char name[100];
        bool gender;
        int age;
    };
    struct stuInfo stu1;
    struct stuInfo class1506[100];
    
    int a2;
    int *pa2 = &a2;
    struct stuInfo stu2;
    struct stuInfo *pStu2 = &stu2;
    
    return 0;
}