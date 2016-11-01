//
//  10_年龄判断程序.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int age;
    printf("请输入一个年龄：\n");
    scanf("%d", &age);
    
    if (age > 18)
    {
        printf("该年龄属于成年人\n");
    }
    else
    {
        printf("该年龄属于未成年人\n");
    }
    
    return 0;
}