//
//  05_猜数字游戏.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    srand((unsigned)time(0));//种种子
    
    int num;
    num = rand() % 100 + 1;//生成一个1~100之间的随机数
    printf("%d\n", num);
    
    int guess = num - 1;
    while (guess != num)
    {
        printf("请输入你猜的数字：");
        scanf("%d", &guess);
        if (guess > num)
        {
            printf("大了\n");
        }
        else if (guess < num)
        {
            printf("小了\n");
        }
    }
    printf("恭喜你，猜对了\n");
    
    
    return 0;
}