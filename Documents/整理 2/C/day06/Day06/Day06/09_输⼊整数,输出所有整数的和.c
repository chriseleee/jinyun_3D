//
//  09_输⼊整数,输出所有整数的和.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int sum = 0;
    
    while(1)
    {
        int num;
        printf("请输入一个整数：");
        scanf("%d", &num);
        if (num == 0)
        {
            break;
        }
        
        sum += num;
    }
    printf("sum = %d\n", sum);
    
    return 0;
}