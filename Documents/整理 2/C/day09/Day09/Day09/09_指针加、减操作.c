//
//  09_指针加、减操作.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[5] = {10, 20, 30, 40, 50};
    int *p = a;//a<==>&a[0]
    p = &a[0];
    
    printf("%d\n", *p);
    printf("%d\n", *(p + 1));//指针可以加上一个整数
    printf("%d\n", *(p + 3));
    printf("%d\n", *(p + 10));//指针可以加上一个整数，但不能越界
    
    int b = 60;
    p = &b;
    printf("%d\n", *(p + 1));//不能，越界

    printf("%d\n", *(a + 1));
    
    p = a;
    p++;//p = p + 1;
    printf("%d\n", *p);
    //a++;//因为a是一个常量地址
    p += 2;
    printf("%d\n", *p);
    //a += 2;
    p--;
    printf("%d\n", *p);
    
    //p = p + a;//两个指针不能想加
    
    int *p1;
    p = &a[0];
    p1 = &a[4];//p + 4 <=> p1
    int r = p1 - p;//两个指针可以相减，结果是两个指针之间的变量个数
    printf("%d\n", r);


    p = a;
    *p++;
    printf("%d\n", *p);
    *++p;
    printf("%d\n", *p);
    p = a;
    (*p)++;
    printf("%d\n", *p);


    
    
    return 0;
}