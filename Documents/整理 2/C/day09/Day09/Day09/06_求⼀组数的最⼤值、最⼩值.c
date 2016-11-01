//
//  06_求⼀组数的最⼤值、最⼩值.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void maxAndMin(int data[], int size, int *max, int *min)
{
    *max = data[0];
    *min = data[0];
    
    for (int i = 1; i < size; i++)
    {
        if (*max < data[i])
        {
            *max = data[i];
        }
        if (*min > data[i])
        {
            *min = data[i];
        }
    }
}

int main()
{
    srand((unsigned)time(0));
    
    int a[10];
    for (int i = 0; i < 10; i++)
    {
        a[i] = rand() % 100;
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    
    int max, min;
    maxAndMin(a, 10, &max, &min);
    printf("max=%d, min=%d\n", max, min);
    
    return 0;
}