//
//  10_可变长参数.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

int sum(int num, ...)//定义了一个可变长参数的函数
{
    int sum = 0;
    
    va_list vap;//定义一个结构体，用于管理可变长的所有参数
    va_start(vap, num);//指向可变长参数表中第一个参数
    for (int i = 0; i < num; i++)
    {
        sum += va_arg(vap, int);//取出可变长参数表中参数，再使参数指针指向下一个参数
    }
    va_end(vap);
    
    return sum;
}

int main()
{
    int s = sum(3, 45, 89, 72);
    printf("%d\n", s);
    
    s = sum(10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    printf("%d\n", s);
    
    return 0;
}