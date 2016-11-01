//
//  06_宏指令.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define SIZE 20
#define PI 3.14
#define BOOL int
#define YES 1
#define NO 0

int main()
{
    int a[SIZE];
    for (int i = 0; i < SIZE; i++)
    {
        printf("请输入一个数：");
        scanf("%d", &a[i]);
    }
    a[5] = 10;
    for (int i = 0; i < SIZE; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    
    
    double area = PI * 5 * 5;
    
    
    int x = 1;
    x = 0;
    BOOL x1 = YES;
    x1 = NO;
    
    return 0;
}