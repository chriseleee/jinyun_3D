//
//  08_占用内存空间.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    printf("%ld\n", sizeof(int[10]));
    printf("%ld\n", sizeof(a));
    
    int a1 = 10;
    int *p = &a1;//&得到的是a1所占4个字节的第一个字节的内存编号
    printf("%ld\n", sizeof(p));
    
    double d = 3.14;
    double *pd = &d;//&得到的是d所占8个字节的第一个字节的地址
    printf("%ld\n", sizeof(pd));
    
    char c = 'a';
    char* pc = &c;
    printf("%ld\n", sizeof(pc));
    
    return 0;
}