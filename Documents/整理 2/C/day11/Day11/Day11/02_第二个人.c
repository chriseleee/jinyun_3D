//
//  02_第二个人.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include "02_第二个人.h"

int maxInArray(int *a, int size)
{
    int max = a[0];
    for (int i = 1; i < 10; i++)
    {
        if (max < a[i])
        {
            max = a[i];
        }
    }
    return max;
}
