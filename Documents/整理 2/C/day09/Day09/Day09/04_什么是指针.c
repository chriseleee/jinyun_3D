//
//  04_什么是指针.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x = 100;
    int *px = &x;//int*是一个新的数据类型
    printf("%ld\n", sizeof(px));
    printf("%p\n", px);
    *px = 200;
    printf("x=%d\n", x);//200
    printf("x=%d\n", *px);//200
    
    float f = 3.14;
    float* pf;
    pf = &f;
    printf("f=%f\n", *pf);//3.14      11：15上课
    
    double d = 12.345;
    double *pd;
    pd = &d;
    printf("d=%lf\n", *pd);//12.345
    
    char c = 'A';
    char *pc;
    pc = &c;
    printf("c=%c\n", *pc);//'A'
    
    
    int *p, b, a[100], *c1;
    printf("sizeof(p)=%ld\n", sizeof(p));
    printf("sizeof(b)=%ld\n", sizeof(b));
    printf("sizeof(a)=%ld\n", sizeof(a));
    printf("sizeof(c1)=%ld\n", sizeof(c1));
    
    return 0;
}