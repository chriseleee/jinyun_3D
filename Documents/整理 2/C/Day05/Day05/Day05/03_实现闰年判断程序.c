//
//  03_实现闰年判断程序.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
//    int year;
//    printf("请输入一个年份：");
//    scanf("%d", &year);
//    
//    if (year % 400 == 0//能被400整除
//        || (year % 4 == 0 && year % 100 != 0)//能被4整除但不能被100整除
//        )
//    {
//        printf("%d是闰年\n", year);
//    }
//    else
//    {
//        printf("%d不是闰年\n", year);
//    }
//    
    
    //从键盘输入一个年份和月份，输出该年的该月是几天。
    int year;
    int month;
    printf("请输入一个年份：");
    scanf("%d", &year);
    printf("请输入月份值：");
    scanf("%d", &month);
    
    int day = 31;
    if (month == 4 || month == 6 || month == 9 || month == 11)
    {
        day = 30;
    }
    else if (month == 2)
    {
        day = 28 + (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0));
    }
    
    printf("%d年%d月有%d天\n", year, month, day);
    
    return 0;
}