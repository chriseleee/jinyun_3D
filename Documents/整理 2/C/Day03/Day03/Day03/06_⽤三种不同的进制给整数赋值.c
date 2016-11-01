//
//  06_⽤三种不同的进制给整数赋值.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x;
    x = 100;//十进制
    printf("%d\n", x);
    
    x = 0100;//八进制数
    printf("%d\n", x);
    printf("%o\n", x);//按八进制打印
    printf("%#o\n", x);//按八进制打印
    
    x = 0x100;//十六进制
    printf("%d\n", x);
    printf("%#x\n", x);//按十六进制输出
    
    return 0;
}