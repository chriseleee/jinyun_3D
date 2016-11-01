//
//  04_while语句.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
//    int x = 0;
//    while (x < 10)
//    {
//        printf("%d ", x);
//        x++;
//    }
//    printf("\n");
//    
//    x = 1;
//    while (x < 10)
//    {
//        printf("%d ", x);
//        x += 2;
//    }
//    printf("\n");
//    
//    x = 0;
//    while (x < 10)
//    {
//        printf("%d ", x);
//        x += 2;
//    }
//    printf("\n");
//    
//    
//    /*---打印下表-----
//     1       1
//     2       4
//     3       9
//     4       16
//     5       25
//     ......
//     ---------------*/
//    
//    x = 1;
//    while (x < 10)
//    {
//        printf("%d\t\t%d\n", x, x * x);
//        x++;
//    }
    
    int num1 = 0;//正数的个数
    int num2 = 0;//负数的个数
    int num = 1;//从键盘输入的数
    
    while (num != 0)//不定次循环
    {
        printf("请输入一个数：");
        scanf("%d", &num);
        if (num > 0)
        {
            num1++;
        }
        else if (num < 0)
        {
            num2++;
        }
    }
    printf("整数:%d,负数:%d\n", num1, num2);
    
    return 0;
}