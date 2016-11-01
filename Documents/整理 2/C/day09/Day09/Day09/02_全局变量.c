//
//  02_全局变量.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int g1;//全局变量,不初始化，系统会自动清0

void fb()
{
    g1++;
    //g2++;//全局变量的作用域是从定义行开始，到文件结束
}

int g2 = 100;

int abc = 100;

void fc()
{
    printf("abc=%d\n", abc);//100
    auto int abc = 200;
    printf("abc=%d\n", abc);//200
    
    {
        int abc = 300;
        printf("abc=%d\n", abc);
    }
}

int main()
{
    g1++;
    printf("g1=%d\n", g1);
    fb();
    printf("g1=%d\n", g1);
    
    fc();
    
    return 0;
}