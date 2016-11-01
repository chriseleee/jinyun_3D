//
//  12_字符串与普通字符数组的区别.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char str[13] = "Hello World\n";//字符数组
    str[0] = 'h';
    printf("%s", str);
    
    
    char *str1 = "Hello World";//字符指针存放的是字符串第一个字符的地址
    *str1 = 'h';//试图修改常量'H', 所以程序崩溃
    printf("%s\n", str1);
    
    return 0;
}