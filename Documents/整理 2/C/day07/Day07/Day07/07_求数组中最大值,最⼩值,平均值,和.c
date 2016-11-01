//
//  07_求数组中最大值,最⼩值,平均值,和.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    srand((unsigned)time(0));//种子只需种一次
    int a[10];
    
    for (int i = 0; i < 10; i++)
    {
        a[i] = rand() % 100;
    }
    
    int max = a[0];
    int min = a[0];
    int sum = a[0];
    for (int i = 1; i < 10; i++)
    {
        if (max < a[i])//求最大值
        {
            max = a[i];
        }
        if (min > a[i])//求最小值
        {
            min = a[i];
        }
        sum += a[i];//求累加和
    }
    
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    printf("max=%d, min=%d, sum=%d\n", max, min, sum);
    
    return 0;
}