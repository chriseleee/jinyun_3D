//
//  02_从键盘上输入两个数,分别求出和、差、积、商.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int number1;
    int number2;
    
    printf("请输入一个数：");
    scanf("%d", &number1);
    printf("请再输入一个数：");
    scanf("%d", &number2);
    
    int sum = number1 + number2;
    printf("两个数的和为：%d\n", sum);
    
    int dif = number1 - number2;
    printf("两个数的差为：%d\n", dif);
    
    int pro = number1 * number2;
    printf("两个数的积为：%d\n", pro);

    int quo = number1 / number2;
    printf("两个数的商为：%d\n", quo);

    
    return 0;
}