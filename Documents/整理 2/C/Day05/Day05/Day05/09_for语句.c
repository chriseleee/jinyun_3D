//
//  09_for语句.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    for (int i = 1; i < 10; i++)
    {
        printf("%d\n", i);
    }
    
    for (int i = 1; i < 10; i += 2)
    {
        printf("%d\n", i);
    }
    
    for (int i = 1; i < 10; i++)
    {
        printf("%d\t", i);
    }
    printf("\n");
    
    for (int i = 2; i < 100; i += 2)
    {
        printf("%d ", i);
    }
    printf("\n");
    
    //计算并输出1~100的和
    int sum = 0;
    for (int i = 1; i <= 100; i++)
    {
        sum += i;
    }
    printf("sum = %d\n", sum);
    
    //计算m~n之间的和（20，65）
    
    return 0;
}