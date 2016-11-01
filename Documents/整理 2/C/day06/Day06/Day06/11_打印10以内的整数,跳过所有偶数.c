//
//  11_打印10以内的整数,跳过所有偶数.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    for (int i = 0; i < 10; i++)
    {
        if (i % 2 == 0)
        {
            continue;
        }
        printf("%d ", i);
    }
    
    return 0;
}