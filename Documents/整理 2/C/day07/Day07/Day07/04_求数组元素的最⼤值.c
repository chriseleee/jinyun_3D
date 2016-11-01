//
//  04_求数组元素的最⼤值.c
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
    srand((unsigned)time(0));//随机数的种子
    
    int arr[10];
    for (int i = 0; i < 10; i++)//循环10次，产生10个随机数，分别赋值给数组的10个元素。
    {
        arr[i] = rand() % 100;
    }
    
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
    
    int max = arr[0];
    for (int i = 1; i < 10; i++)
    {
        if (max < arr[i])
        {
            max = arr[i];
        }
    }
    printf("max=%d\n", max);
    
    return 0;
}