//
//  04_算数运算符.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    //加减乘除
    int a = 10;
    int b = 20;
    int r;
    r = a + b;
    printf("r=%d\n", r);
    r = a- b;
    printf("r=%d\n", r);
    r = a * b;
    printf("r=%d\n", r);
    r = a / b;//两个整数相除，结果还是整数
    printf("r=%d\n", r);
    double r1 = a * 1.0 / b;
    r1 = (double)a / b;
    printf("r1=%g\n", r1);

    //求余数%
    a = 5;
    b = 3;
    r = a % b;
    printf("a%%b=%d\n", r);
    //余数的符号只与被除数相同，与除数无关
    printf("5%%3=%d\n", 5%3);
    printf("-5%%3=%d\n", -5%3);
    printf("5%%-3=%d\n", 5%-3);
    printf("-5%%-3=%d\n", -5%-3);

    float f = 3.14;
    //r = f % 3;//只能对整数求余数，不能对小数求余数
    
    //将一个两位数反向输出，34，43
    a = 34;
    printf("%d%d", 34 % 10, 34 / 10);
    
    //将一个三位数反向输出， 123，321
    
    return 0;
}