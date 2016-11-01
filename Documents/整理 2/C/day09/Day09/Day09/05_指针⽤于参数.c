//
//  05_指针⽤于参数.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void increment(int x)
{
    x++;
}

void increment1(int *x)
{
    (*x)++;
}

int main()
{
    int x = 100;
    increment(x);
    printf("x=%d\n", x);
    
    int *px;
    px = &x;
    printf("x=%d\n", *px);
    increment1(&x);
    printf("x=%d\n", x);
    
    return 0;
}