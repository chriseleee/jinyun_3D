//
//  05_求两个数的和.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int add(int x, int y)
{
    return x + y;
}

int sub(int x, int y)
{
    return x - y;
}

int mul(int x, int y)
{
    return x * y;
}

double div1(int x, int y)
{
    if (y == 0)
        return 0;
    return x * 1.0 / y;
}

int main()
{
    int x = 10;
    int y = 20;
    printf("%d,%d这两个数的和为%d\n", x, y, add(x, y));
    printf("%d,%d这两个数的差为%d\n", x, y, sub(x, y));
    printf("%d,%d这两个数的积为%d\n", x, y, mul(x, y));
    printf("%d,%d这两个数的商为%g\n", x, y, div1(x, y));
    
    return 0;
}