//
//  07_什么是枚举.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

enum Week
{
    MONDAY,//枚举常量
    TUESDAY,
    WEDNESDAY,
    THURDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY,
};

enum Month
{
    JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC,
};

int main()
{
    printf("%d\n", JAN);
    printf("%d\n", FEB);
    printf("%d\n", MAR);

    int a = NOV;
    
    int week;
    printf("请输入一个1~7之间的数：");
    scanf("%d", &week);
    switch (week - 1) {
        case MONDAY:
            printf("星期一\n");
            break;
        case TUESDAY:
            printf("星期二\n");
            break;
        case WEDNESDAY:
            printf("星期三\n");
            break;
        case THURDAY:
            printf("星期四\n");
            break;
        case FRIDAY:
            printf("星期五\n");
            break;
        case SATURDAY:
            printf("星期六\n");
            break;
        case SUNDAY:
            printf("星期日\n");
            break;
        default:
            printf("输入错误\n");
            break;
    }
    return 0;
}