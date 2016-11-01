//
//  03_⽆符号的整型.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    unsigned int i5;//无符号整型
    printf("%ld\n", sizeof(i5));
    i5 = 4294967295;
    printf("%u\n", i5);
    i5 = i5 + 1;
    printf("%u\n", i5);
    
    
    unsigned short int i6;//无符号短整型
    printf("%ld\n", sizeof(i6));
    
    
    unsigned long int i7;//无符号长整型
    printf("%ld\n", sizeof(i7));
    
    unsigned long long int i8;//无符号长长整型
    printf("%ld\n", sizeof(i8));
    
    return 0;
}