//
//  06_数组的正反遍历.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[5] = {1, 2, 3, 4, 5};
    //正向遍历数组
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    
    //反向遍历数组
    for (int i = 4; i >= 0; i--)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    
    return 0;
}