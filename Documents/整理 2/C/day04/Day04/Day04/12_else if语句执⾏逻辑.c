//
//  12_else if语句执⾏逻辑.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x;
    printf("请输入一个整数：\n");
    scanf("%d", &x);
    
    if (x >= 3)
    {
        printf("x>=3\n");
    }
    else if (x >= 2)
    {
        printf("x>=2\n");
    }
    else if (x >= 1)
    {
        printf("x>=1\n");
    }
    else
    {
        printf("other\n");
    }
    
    
    printf("请输入今天的天气情况(0:晴，1：阴，2：多云，3：下雨)");
    scanf("%d", &x);
    
    if (x == 0)
    {
        printf("打太极\n");
    }
    else if (x == 1)
    {
        printf("爬香山\n");
    }
    else if (x == 2)
    {
        printf("约会\n");
    }
    else if (x == 4)
    {
        printf("睡觉\n");
    }
    else
    {
        printf("上班\n");
    }
    
    return 0;
}