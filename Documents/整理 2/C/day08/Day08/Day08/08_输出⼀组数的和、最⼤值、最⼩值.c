//
//  08_输出⼀组数的和、最⼤值、最⼩值.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int maxValue(int data[], int size)
{
    int max = data[0];
    for (int i = 1; i < size; i++)
    {
        if (max < data[i])
        {
            max = data[i];
        }
    }
    return max;
}

int minValue(int data[], int size)
{
    int min = data[0];
    for (int i = 1; i < size; i++)
    {
        if (min > data[i])
        {
            min = data[i];
        }
    }
    return min;
}

int sumValue(int data[], int size)
{
    int sum = 0;
    for (int i = 0; i < size; i++)
    {
        sum += data[i];
    }
    return sum;
}

int main()
{
    srand((unsigned)time(0));
    
    int data[10];
    for (int i = 0; i < 10; i++)
    {
        data[i] = rand() % 100;
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", data[i]);
    }
    printf("\n");
    
    int max = maxValue(data, 10);
    printf("最大值为%d\n", max);
    
    int min = minValue(data, 10);
    printf("最小值为%d\n", min);
    
    int sum = sumValue(data, 10);
    printf("和为%d\n", sum);
    
    return 0;
}