//
//  02_sizeof.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int x = 10;
    printf("%ld\n", sizeof(x));//求变量所占的字节数
    printf("%ld\n", sizeof(double));//求类型所占的字节数
    printf("%ld\n", sizeof(unsigned long long int));
    
    printf("%ld\n", sizeof(3 + 4.1 * 0.5));//求表达式结果所占的字节数
    
    x = 1;
    printf("%ld\n", sizeof(x = 10));//表达是不会被执行
    printf("%d\n", x);
    return 0;
}