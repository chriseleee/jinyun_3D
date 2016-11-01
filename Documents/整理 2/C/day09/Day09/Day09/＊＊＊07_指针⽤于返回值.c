//
//  07_指针⽤于返回值.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int* fa(int *x)
{
    *x += 10;
    return x;//返回指针
}

int* get()
{
    int x = 12345;
    return &x;//返回局部变量的地址
}

void get2()
{
    double a = 12.345;
}

int* get3()
{
    static int x = 12345;
    return &x;
}

int main()
{
    int a = 10;
    int *p;
    p = fa(&a);
    printf("a=%d\n", a);
    printf("a=%d\n", *p);
    
    p = get();//把一个已经释放的空间的地址赋给p，p得到的是一个“悬空指针”
    get2();
    printf("%d\n", *p);
    
    p = get3();
    printf("%d\n", *p);
    
    return 0;
}