//
//  11_将输⼊字母以⼤写形式输出.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char ch;
    printf("请输入一个字母：\n");
    scanf("%c", &ch);
    
    if (ch >= 'A')
    {
        if (ch <= 'Z')
        {
            printf("%c\n", ch);
        }
    }
    
    if (ch >= 'a')
    {
        if (ch <= 'z')
        {
            printf("%c\n", ch - ('a' - 'A'));
        }
    }
    
    return 0;
}