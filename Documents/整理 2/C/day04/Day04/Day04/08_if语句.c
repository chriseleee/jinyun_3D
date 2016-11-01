//
//  08_if语句.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int x = -5;
    if (x + 5)
    {
        printf("OK\n");
    }
    
    bool r = "abc";
    printf("%d\n", r);
    if ("abc")
    {
        printf("abc\n");
    }
    
    double y = 3.14;
    if (y)
    {
        printf("%lf\n", y);
    }
    
    int power1 = 1000;
    int power2 = 800;
    if (power1 < power2)
    {//大括号内的多条语句称为复合语句
        printf("开火\n");
        printf("差点阵亡\n");
    }
    
    printf("请输入一个数：");
    scanf("%d", &x);
    if (x > 100)
    {
        printf("x = %d\n", x);
    }
    
    
    double money = 3.0;
    double price = 2.9;
    double d3 = money - price - 0.1;
    if (d3)
    {
        printf("d3不是0\n");
    }
    if (d3 < 1E-17)//d3 == 0
    {
        printf("d3是0\n");
    }
    
    if (power1 > 800)
    {
        ;//开火并判断是否击中敌人
    }
    
    return 0;
}