//
//  03_scanf函数.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x;
    printf("请输入一个整数:");
    scanf("%d", &x);//只能有格式控制符
    printf("输入的整数为：%d\n", x);
    
    short y;
    scanf("%hd", &y);
    
    long z;
    scanf("%ld", &z);
    
    float f;
    scanf("%f", &f);
    
    double g;
    scanf("%lf", &g);
    
    return 0;
}