//
//  08_特殊字符.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    //\n的使用
    printf("Hello world\n");
    char ch = 'A';
    printf("ch = %c\n", ch);
    printf("a\n\n\nb\n");
    
    //\r的使用
    printf("abcdef\rhij\n");
    printf("123456789\rabcdef\n");
    
    //\t的使用
    printf("abcd\thij\n");
    printf("123\t567\n");
    printf("------------------\n");
    printf("姓名\t年龄\n");
    printf("zhang\t18\n");
    printf("li\t20\n");
    //反斜线的打印
    printf("------------------\n");
    printf("abc\\def\\hij\n");
    printf("打印一个反斜线\\\n");
    
    //单引号的打印
    char ch1;
    ch1 = 'a';
    ch1 = '\'';
    printf("打印一个单引号：%c\n", ch1);
    
    //双引号的打印
    printf("He say:\"How are you!\"\n");
    
    return 0;
}