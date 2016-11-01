//
//  04_函数调⽤.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

//写一个函数，求两个数的平均值
double average(int x, int y);

int main()
{
    int x = 5, y = 7, z = 10;
    double xy = average(x, y);
    double xz = average(x, z);
    printf("平均值是%g\n", average(xy, xz));//实参可以是常量或变量
    
    double ave = average(x, (y + z) / 2.0);//实参还可以是表达式
    printf("%g\n", ave);
    
    ave = average(x, average(y, z));//实参还可以是函数调用
    
    return 0;
}

double average(int x, int y)
{
    return (x + y) / 2.0;
}