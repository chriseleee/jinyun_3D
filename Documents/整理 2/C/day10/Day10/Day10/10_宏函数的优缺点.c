//
//  10_宏函数的优缺点.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define SQUARE(x) ((x) * (x))
#define SUM(x, y) (x) + (y)
#define SWAP(T, x, y) {T t = x; x = y; y = t;}
#define MAX(x, y) ((x) > (y) ? (x) : (y))

int main()
{
    //宏函数中的参数一定要用括号括起来，以防止替换后的优先级问题
    int a = 4;
    printf("%d\n", SQUARE(a));
    printf("a+2的平方是%d\n", SQUARE(a + 2));
    
    //宏函数的整个表达式也需要用括号括起来
    printf("%d\n", SUM(10, 20) * 5);
    
    //宏函数中的多条语句，应该写成复合语句，以防止重复定义变量
    int a1 = 10;
    int b1 = 20;
    SWAP(int, a1, b1);
    a1 = 50;
    b1 = 70;
    SWAP(int, a1, b1);
    
    //宏函数中不要使用++ 、--
    a1 = 3;
    b1 = 4;
    int r = MAX(a1++, b1++);
    printf("a1=%d, b1=%d, r=%d\n", a1, b1, r);
    
    return 0;
}