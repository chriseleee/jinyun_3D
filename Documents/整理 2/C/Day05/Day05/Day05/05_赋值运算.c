//
//  05_赋值运算.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x;
    x = 3;//赋值号左边(左值)必须是变量
//    3 = x;//左值不能是常量
    int y = 5;
//    x + y = 10;//左值也不能是表达式
//    -x = 6;
//    x++ = 7;
    
    int z = x + (y = 5);
    
    int a, b, c, d;
    a = b = c = d = 1;
    printf("%d,%d,%d,%d\n", a, b, c, d);
    
    a = 10;
    b = 20;
    printf("%d\n", a = b);
    printf("%d\n", a == b);
    
    if (10 == a)//这样写可避免漏掉一个等号的错误
        printf("%d\n", a);
    
    int x1;
    x1 = 10;
    x1 += 5;//x1 = x1 + 5;
    printf("%d\n", x1);
    x1 -= 3;//x1 = x1 - 3;
    printf("%d\n", x1);
    x1 *= 2;//x1 = x1 * 2;
    printf("%d\n", x1);
    
    x1 = 10;
    x1 *= (5 + 3);//x1 = x1 * (5 + 3)
    printf("%d\n", x1);


    
    return 0;
}