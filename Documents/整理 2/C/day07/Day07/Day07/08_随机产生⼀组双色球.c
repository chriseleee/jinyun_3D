//
//  08_随机产生⼀组双色球.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    srand((unsigned)time(0));
    //生成兰球
    int blue;
    blue = rand() % 16 + 1;
    
    int red[6];
    for (int i = 0; i < 6; i++)
    {
        red[i] = rand() % 33 + 1;
        //判断是否发生重复
        for (int j = 0; j < i; j++)
        {
            if (red[i] == red[j])
            {
                i--;
                break;
            }
        }
    }
    printf("blue:%d\n", blue);
    printf("red:");
    for (int i = 0; i < 6; i++) {
        printf("%d ", red[i]);
    }

    
    return 0;
}