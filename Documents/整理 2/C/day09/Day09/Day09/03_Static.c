//
//  03_static关键字.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void fa()
{
    int n = 1;//变量n诞生
    printf("%d ", n);
    n++;
}//变量n死亡

void fb()
{
    static int n = 1;//函数fb第一次被调用时，变量n诞生
    printf("%d ", n);
    n++;
}

int main()
{
    for (int i = 0; i < 5; i++)
    {
        fa();
    }
    printf("\n");

    for (int i = 0; i < 5; i++)
    {
        fb();
    }
    printf("\n");
    
    return 0;
}//函数fb中的变量n，在此处死亡