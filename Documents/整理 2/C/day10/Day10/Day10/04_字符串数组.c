//
//  04_字符串数组.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main()
{
    char *str[5] = {"aaa", "bbb", "ccc", "ddd", "eee"};
    printf("%ld\n", sizeof(str[0]));
    str[0] = "AAAA";
    for (int i = 0; i < 5; i++)
    {
        
        printf("%s\n", str[i]);
    }
    
    char *name[4] = {"zhangsan", "lisi", "wangwu", "zhaoliu"};
    for (int i = 0; i < 4; i++)
    {
        printf("%s\n", name[i]);
    }
    for (int i = 0; i < 4; i++)
    {
        if (strcmp(name[i], "lisi") == 0)
        {
            printf("%s\n", name[i]);
        }
    }
    
    return 0;
}