//
//  07_switch-case语句.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    //从键盘输入一个1~7之间的数字，输出对应的星期几
//    int day;
//    printf("请输入一个1~7之间的整数：");
//    scanf("%d", &day);
//    
//    if (day < 1 || day > 7)
//    {
//        printf("输入数字错误！\n");
//        return 1;
//    }
//    
//    if (1 == day)
//    {
//        printf("星期一\n");
//    }
//    else if (2 == day)
//    {
//        printf("星期二\n");
//    }
//    else if (3 == day)
//    {
//        printf("星期三\n");
//    }
//    else if (4 == day)
//    {
//        printf("星期四\n");
//    }
//    else if (5 == day)
//    {
//        printf("星期五\n");
//    }
//    else if (6 == day)
//    {
//        printf("星期六\n");
//    }
//    else if (7 == day)
//    {
//        printf("星期日\n");
//    }
//
//    switch(day)//括号内一定是整数，int、short、char，不能是float、double
//    {
//        case 3:
//            printf("星期三\n");
//            break;
//        case 1://case后面有且仅有一个整数常量
//            printf("星期一\n");
//            break;//退出switch语句
//        case 2://case后面的常量不能相同，但没有顺序要求
//            printf("星期二\n");
//            break;
//        case 4:
//            printf("星期四\n");
//            break;
//        case 5:
//            printf("星期五\n");
//            break;
//        case 6:
//            printf("星期六\n");
//            break;
//        case 7:
//            printf("星期日\n");
//            break;
//    }
//    
    
    
    //从键盘输入一个年份和月份，输出该年的该月是几天。
//    int year;
//    int month;
//    printf("请输入一个年份：");
//    scanf("%d", &year);
//    printf("请输入月份值：");
//    scanf("%d", &month);
//    
//    int day = 31;
//    if (month == 4 || month == 6 || month == 9 || month == 11)
//    {
//        day = 30;
//    }
//    else if (month == 2)
//    {
//        day = 28 + (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0));
//    }
//    
//    printf("%d年%d月有%d天\n", year, month, day);
//
//    switch(month)
//    {
//        case 1:
//        case 3:
//        case 5:
//        case 7:
//        case 8:
//        case 10:
//        case 12:
//            printf("31\n");
//            break;
//        case 2:
//            printf("%d\n", 28 + (year%400==0 || (year%4==0&&year%100!=0)));
//        case 4:
//        case 6:
//        case 9:
//        case 11:
//            printf("30\n");
//            break;
//    }
    
    
    //从键盘输入一个天气，输出我做的事情（0：晴，1：阴，2：多云，3：下雨）
    int x;
    printf("请输入天气值");
    scanf("%d", &x);
    switch(x)
    {
        case 0:
            printf("打太极\n");
            break;
        case 1:
            printf("爬香山\n");
            break;
        case 2:
            printf("约会\n");
            break;
        case 3:
            printf("睡觉\n");
            break;
        default://可有可无的
            printf("上班\n");
            break;
    }
    return 0;
}