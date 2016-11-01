//
//  02_函数语法.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

bool isPrimer(int x)//函数头，包括返回值类型、函数名、函数参数
{//大括号内的内容为函数体
    if (x < 2)
        return false;
    for (int i = 2; i < x; i++)
    {
        if (x % i == 0)
        {
            return false;
        }
    }
    return true;
}

//写一个函数，判断x、y是否(同时)在0~n的区间内
bool check(int x, int y, int n)//函数的声明和定义
{
    if (x < 0 || x > 100)
    {
        return false;
    }
    else if (y < 0 || y > 100)
    {
        return false;
    }
    
    return true;
//    return x >=0 && x <= n && y >=0 && y <= n;
}

int main()
{
    for (int i = 0; i < 100; i++)
    {
        if (isPrimer(i))//函数的调用
        {
            printf("%d ", i);
        }
    }
    printf("\n");
    
    printf("%d\n", check(3, 5, 10));
    
    return 0;
}