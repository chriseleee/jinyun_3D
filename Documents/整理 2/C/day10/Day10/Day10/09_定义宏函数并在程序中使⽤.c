//
//  09_定义宏函数并在程序中使⽤.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define IS_EVEN(x) ((x) % 2 == 0)
#define UPPER(ch) ((ch) >= 'a' && (ch) <= 'z' ? (ch) - 'a' + 'A' : (ch))
#define SWAP(T, a, b) {T temp = a; a = b; b = temp;}

int main()
{
    printf("MAX(3, 4)=%d\n", MAX(3, 4));
    
    
    int a = 10;
    if (IS_EVEN(a))
    {
        printf("%d是偶数\n", a);
    }
    
    printf("%c\n", UPPER('g'));
    
    a = 10;
    int b = 20;
    SWAP(int, a, b);
    printf("a=%d, b=%d\n", a, b);
    
    double d1 = 3.14;
    double d2 = 6.28;
    SWAP(double, d1, d2);
    printf("d1=%lf,d2=%lf\n", d1, d2);
    
    return 0;
}