//
//  04_条件(三⽬)运算.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a = 30;
    int b = 20;
    int max;
    max = a > b ? a : b;
//    if (a > b)
//    {
//        max = a;
//    }
//    else
//    {
//        max = b;
//    }
    printf("max = %d\n", max);
    
    int gender;
    printf("请输入你的性别（1，男  0，女）:");
    scanf("%d", &gender);
    printf("%s\n", gender ? "男" : "女");
    
    
    //从键盘输入一个年份，输出该年2月的天数
    int year;
    printf("请输入一个年份：\n");
    scanf("%d", &year);
    int day;
    day = (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) ? 29 : 28;
    printf("该年2月有%d天\n", day);
    
    return 0;
}