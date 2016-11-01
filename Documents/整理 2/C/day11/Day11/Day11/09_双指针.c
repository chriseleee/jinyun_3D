//
//  09_双指针.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void getMessage(char *str)
{
    str = "Hello World";
}

void getMessage1(char **str)
{
    *str = "Hello World";
}

int main()
{
    int a = 10;
    int *p;
    p = &a;
    int **p1;
    p1 = &p;
    
    char *str;
    getMessage(str);
    getMessage1(&str);
    printf("%s\n", str);
    
    return 0;
}