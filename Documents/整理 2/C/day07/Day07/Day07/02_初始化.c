//
//  02_初始化.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x = 10;//变量的初始化
    int a[5] = {1, 2, 3, 4, 5};
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    
    int a1[5] = {1, 2};//初始化值的个数少于数组长度时，自动补0
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a1[i]);
    }
    printf("\n");
    
    int a11[5] = {0};//int a11[5] = {};
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a11[i]);
    }
    printf("\n");
    
    int a2[5] = {1, 2, 3, 4, 5, 6, 7};//初始化值的个数多于数组长度时，多出的被丢掉
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a2[i]);
    }
    printf("\n");
    
    int a3[] = {1, 2, 3, 4, 5};//当所有初始化值都被列出时，可以不写数组元素个数
    
    int a4[5] = {[2] = 50, [0] = 3, [4] = 20};//C99标准新增的方法
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a4[i]);
    }
    printf("\n");
    
    
    //将数组内的值依次向前移动一个位置，第一个元素放到最后的位置
    int a5[5] = {1, 2, 3, 4, 5};
    int t = a5[0];
    for (int i = 0; i < 4; i++)
    {
        a5[i] = a5[i + 1];
    }
    a5[4] = t;
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a5[i]);
    }
    printf("\n");
    
    return 0;
}