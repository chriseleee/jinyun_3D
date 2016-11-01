//
//  9标准.c
//  Day07
//
//  Created by tarena03 on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.

#include <stdio.h>
#include <string.h>
int main( )
{
    int size;
    while (1)
    {
        printf("请输入九宫格的宽度:");
        scanf("%d", &size);
        if (size % 2)
            break;
    }
    int area[size][size];
    memset(area, 0, sizeof(area));
    for (int i = 1, k = 0,j=(size-1)/2
         ; i <= size * size; i++)
    {
        area[k][j] = i;
        k--;
        j++;
        if ((area[k][j] && k > -1&& j < size) || (k <0&& j >= size))
        {
            k += 2;
            j--;
            continue;
        }
        if (k <0)
        {
            k = size - 1;
            continue;
        }
        if (j >= size)
        {
            j = 0;
            continue;
        }
    }
    for (int i = 0; i < size; i++)
    {
        for (int j = 0; j < size; j++)
            printf ("%d\t", area[i][j]);
        printf("\n");
    }
    return 0;
}