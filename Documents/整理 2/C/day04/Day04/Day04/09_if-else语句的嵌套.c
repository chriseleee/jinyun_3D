//
//  09_if-else语句的嵌套.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int power1 = 500;
    int power2 = 800;
    if (power1 > power2)
    {
        printf("你中弹\n");
        printf("你死\n");
    }
    else
    {
        printf("我中弹\n");
        printf("重伤\n");
    }
    
    
    int salary;
    printf("请告诉我，贵公司最多给我多少钱：");
    scanf("%d", &salary);
    if (salary < 6000)
    {
        printf("我不能接受\n");
    }
    else
    {
        printf("很高兴入职贵公司\n");
    }
    
    return 0;
}