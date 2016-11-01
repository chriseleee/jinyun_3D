//
//  04_结构体所占内存空间.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

struct Size
{
    char ch;
    int x;
};

struct Size1
{
    int x;
    double d;
};

struct Size2
{
    int x;
    char ch;
    double d;
};

struct Size3
{
    int x;
    double d;
    char ch;
};

struct Size4
{
    int x;
    char ch[10];
    double d;
};

int main()
{
    struct Size a;
    printf("%ld\n", sizeof(a));
    
    struct Size1 b;
    printf("%ld\n", sizeof(b));
    
    struct Size2 c;
    printf("%ld\n", sizeof(c));
    
    struct Size3 d;
    printf("%ld\n", sizeof(d));
    
    struct Size4 e;
    printf("%ld\n", sizeof(e));
    
    return 0;
}