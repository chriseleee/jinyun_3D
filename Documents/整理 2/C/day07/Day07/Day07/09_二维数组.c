//
//  09_二维数组.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[2][3];
    a[0][0] = 3;
    a[0][1] = 4;
    a[0][2] = 5;
    a[1][0] = 6;
    a[1][1] = 7;
    a[1][2] = 8;
    
    
    int b[2][3] = {{1, 2, 3}, {4, 5, 6}};
    for (int i = 0; i < 2; i++)//第一维
    {
        for (int j = 0; j < 3; j++)//第二维
        {
            printf("%d ", b[i][j]);
        }
        printf("\n");
    }
    
    int b1[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            printf("%d ", b1[i][j]);
        }
        printf("\n");
    }
    
    int b2[3][3] = {{1, 2, 3}, {4}, {5, 6, 7}};
    
    int b3[3][3] = {0};//9个元素全清0
    
    
    
    
    
    
    
    
    /*----------------------
     
     1     1     1     1
     2     4     8     2的平方根
     3     9     27    3的平方根
     4     16    64    4的平方根是2
     ......
     9     81    729   9的平方根是3
     
     -----------------------*/
    int table[9][4];
    for (int i = 0; i < 9; i++)
    {
        table[i][0] = i + 1;//数据本身
        table[i][1] = table[i][0] * table[i][0];//平方值
        table[i][2] = table[i][1] * table[i][0];//立方值
        table[i][3] = sqrt(table[i][0]);//平方根
    }
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            printf("%d\t", table[i][j]);
        }
        printf("\n");
    }
    
    
    
    
    
    /*-----------------------
     
     No.      C       OC
     1        98      76
     2        100     100
     3        75      100
     4        88      96
     5        76      76
     
     -------------------------*/
    
    int table1[5][3] = {
        {1, 98, 76},
        {2, 100, 100},
        {3, 75, 100},
        {4, 88, 96},
        {5, 76, 76}};
     
    
    return 0;
}