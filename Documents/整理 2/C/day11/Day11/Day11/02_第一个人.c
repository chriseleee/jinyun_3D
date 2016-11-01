//
//  02_第一个人.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include "02_第一个人.h"

void input(int *a, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("请输入一个数:");
        scanf("%d", &a[i]);
    }
}
