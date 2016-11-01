//
//  10_循环中使⽤continue语句.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    for (int i = 0; i < 10; i++)
    {
        if (5 == i)
        {
            continue;
        }
        printf("%d ", i);
    }
    printf("\n");
    //输出3及3的倍数
    for (int i = 0; i < 100; i++)
    {
        if (i % 3 != 0)
            continue;
        printf("%d ", i);
    }
    printf("\n");
    
    //数7的游戏
    for (int i = 0; i < 100; i++)
    {
        if (i % 7 == 0 || i % 10 == 7 || i / 10 == 7)
        {
            continue;
        }
        printf("%d ", i);
    }
    printf("\n");
    
    
    for (int i = 1; i <= 5; i++)
    {
        if (i % 2)//i为奇数时打印*
        {
            printf("*");
        }
        else
        {
            continue;
        }
        printf("#");
    }
    printf("$\n");
    
    return 0;
}