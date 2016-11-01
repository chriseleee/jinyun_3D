//
//  05_整数类型(int、long)使⽤常见问题汇总.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int i = 123456789000;//超出范围
    printf("%d\n", i);
    
    int c = 5 / 3;//两个整型数相除，结果还是整型数
    printf("%d\n", c);
    float c1 = 5 * 1.0 / 3;
    printf("%f\n", c1);
    
    int a = 2147483647;
    a = a + 1;//超出范围
    printf("%d\n", a);
    int b = -2147483648;
    b = b - 1;//超出范围
    printf("%d\n", b);
    
    return 0;
}