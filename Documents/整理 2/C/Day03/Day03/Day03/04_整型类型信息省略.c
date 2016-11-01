//
//  04_整型类型信息省略.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    short s = 100;
    printf("%hd\n", s);
    long l = 1234567890;
    printf("%ld\n", l);
    long long ll = 1234500000;
    printf("%lld\n", ll);
    
    unsigned u = 200;
    printf("%u\n", u);
    unsigned short us = 10;
    printf("%hu\n", us);
    unsigned long ul = 12345;
    printf("%lu\n", ul);
    unsigned long long ull = 1234567890;
    printf("%llu\n", ull);
    
    return 0;
}