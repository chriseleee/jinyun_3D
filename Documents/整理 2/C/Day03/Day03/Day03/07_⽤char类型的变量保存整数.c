//
//  07_⽤char类型的变量保存整数.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char ch;
    ch = 65;
    printf("%d\n", ch);
    printf("%c\n", ch);
    ch = 'a';
    printf("%d\n", ch);
    printf("%c\n", ch);
    ch = 'B';
    printf("%d\n", ch);
    printf("%c\n", ch);
    printf("%ld\n", sizeof(ch));

    ch = 'ABC';//'ABC'等效于'C'
    printf("%c\n", ch);
    
    ch = 'A';
//    ch = ch + 1;
//    printf("%c\n", ch);
    ch = ch + 32;
    printf("%c\n", ch);
    
    ch = 'a';
    printf("%c\n", ch - 32);
    
    //ch = '中';//中文不能作为单个字符使用
    
    return 0;
}