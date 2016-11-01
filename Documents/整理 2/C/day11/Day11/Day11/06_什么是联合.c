//
//  06_什么是联合.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    union exam
    {
        int a;
        int b;
        int c;
    };
    
    
    union exam a;
    printf("%ld\n", sizeof(a));
    a.a = 10;
    printf("%d, %d\n", a.b, a.c);
    a.b = 20;
    printf("%d, %d\n", a.a, a.c);
    
    union exam1
    {
        char ch;
        int x;
    };//此联合公用4个字节
    
    union exam2
    {
        char ch;
        short s;
        double d;
    };
    
    return 0;
}