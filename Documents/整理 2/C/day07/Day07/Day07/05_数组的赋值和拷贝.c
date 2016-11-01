//
//  05_数组的赋值和拷贝.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[5];
    a[0] = 10;//数组的赋值，只能单个元素的进行
    //a = {1, 2, 3, 4, 5};//不能对数组进行整体赋值
    
    int a1[5] = {1, 2, 3, 4, 5};
    int a2[5];
    //可以通过一个循环，来拷贝数组
    for (int i = 0; i < 5; i++)
    {
        a2[i] = a1[i];
    }
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a2[i]);
    }
    printf("\n");
    
    return 0;
}