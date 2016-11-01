//
//  07_定义宏并在程序中使⽤.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SIZE 100

int main()
{
    srand((unsigned)time(0));
    
    int a[SIZE];
    for (int i = 0; i < SIZE; i++)
    {
        a[i] = rand() % 100;
    }
    
    int max = a[0];
    for (int i = 1; i < SIZE; i++)
    {
        if (max < a[i])
        {
            max = a[i];
        }
    }
    
    for (int i = 0; i < SIZE; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    printf("max = %d\n", max);
    
    return 0;
}