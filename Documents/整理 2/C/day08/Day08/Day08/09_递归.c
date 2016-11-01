//
//  09_递归.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int power(int x, int n)
{
    if (1 == n)
    {
        return x;
    }
    return x * power(x, n - 1);
}

int fn(int x)
{
    if (1 == x)
        return 1;
    return x * fn(x - 1);
}

//int fn1(int x)
//{
//    if (x > 5000) {
//        return x;
//    }
//    return fn1(2*x);
//}

int main()
{
    int a;
    a = power(5, 5);
    
    a = fn(5);
    printf("5!=%d\n", a);
    
    
    
    return 0;
}