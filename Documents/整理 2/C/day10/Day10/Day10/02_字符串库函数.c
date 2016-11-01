//
//  02_字符串库函数.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main()
{
    char str[100] = {};
    strcpy(str, "a string");//字符串拷贝//
    printf("%s\n", str);
    
    char str1[5] = {};
    //strcpy(str1, str);
    strncpy(str1, str, sizeof(str1) - 1);//字符串指定字符个数拷贝
    printf("%s\n", str1);
    
    memset(str, 0, sizeof(str));//字符串清0
    strncpy(str, "123456", 3);
    printf("%s\n", str);
    
    strcpy(str, "This is a string.");
    unsigned long len = strlen(str);//求字符串长度，不包括‘\0’;
    printf("%lu\n", len);
    printf("%ld\n", sizeof(str));
    
    strcpy(str, "This is ");
    strcat(str, "a string");//拼接字符串
    printf("%s\n", str);
    strncat(str, "1234567890", 3);
    printf("%s\n", str);
    
    char *str2;
    //strcpy(str2, "abcdef");//有可能崩溃，因为str2中是随机值
    //strcat(str2, "1234567890");
    
    char str3[] = "Hello";
    char *str4 = "Hello";
    
    if (strcmp(str3, str4) == 0)//对比两个字符串是否相同，相同则返回0
    {
        printf("两个字符串相同\n");
    }
    else
    {
        printf("两个字符串不同\n");
    }
    
    return 0;
}