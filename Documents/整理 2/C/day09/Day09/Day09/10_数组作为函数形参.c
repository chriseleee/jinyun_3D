//
//  10_数组作为函数形参.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void print(int a[], int size)//数组作为形参的时候，会退化成一个指针来处理
{
    printf("in print %ld\n", sizeof(a));
    for (int i = 0; i < size; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void print1(int *a, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d ", a[i]);//a[i]<=>*(a+i)
    }
    printf("\n");
}

int main()
{
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    print(a, 10);
    print1(a, 10);
    printf("%ld\n", sizeof(a));//要得到的是数组a所占的储存空间，不是数组名所占的储存空间
    
    int b;
    printf("%ld\n", sizeof(b));
    
    return 0;
}