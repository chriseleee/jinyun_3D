//
//  05_输⼊⼀个姓名,判断是否是五虎上将.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char name[100];
    printf("请输入一个名字：");
    scanf("%s", name);
    
    char *tiger[5] = {"GuanYu", "ZhangFei", "ZhaoYun", "MaChao", "HuangZhong"};
    int i = 0;
    for (; i < 5; i++)
    {
        if (strcmp(tiger[i], name) == 0)
        {
            printf("%s是五虎上将之一\n", name);
            break;
        }
    }
    if (5 == i)
    {
        printf("%s不是五虎上将之一\n", name);
    }
}