//
//  05_键盘输⼊一个秒数,输出X小时X分钟X秒.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int secondNumber;
    printf("请输入一个秒数：");
    scanf("%d", &secondNumber);
    
    int hour;
    hour = secondNumber / 3600;
    int minute;
    minute = secondNumber % 3600 / 60;
    int second;
    second = secondNumber %3600 % 60;
    printf("%d:%d:%d\n", hour, minute, second);
    return 0;
}