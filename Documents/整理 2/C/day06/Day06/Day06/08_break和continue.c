//
//  08_break和continue.c
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
        printf("%d ", i);
        if (5 == i)
        {
            break;
        }
    }
    
    double money = 0;
    printf("请输入你要取的钱数：");
    while (1)
    {
        scanf ("%lf", &money);
        if (money > 0)
            break;
        printf("输入错误，请重新输入");
    }
    printf("你获得了%.2lf\n", money);
    
    return 0;
}