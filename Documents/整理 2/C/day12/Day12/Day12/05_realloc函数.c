//
//  05_realloc函数.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *p = (int *)malloc(sizeof(int) * 5);
    for (int i = 0; i < 5; i++)
    {
        printf("请输入一个学生的C语言成绩：");
        scanf("%d", p + i);//&p[i]<=>(p+i)
        //scanf("%d", &p[i]);//&p[i]<=>(p+i)
    }
    
    p = (int*)realloc(p, sizeof(int) * 7);//realloc能够扩大原有的空间
    for (int i = 0; i < 7; i++)
    {
        printf("请输入一个学生的C语言成绩：");
        scanf("%d", p + i);
    }
    
    
    return 0;
}