//
//  09_数据类型之间的转换.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main()
{
    int i = 10;
    char str[100];
    sprintf(str, "%d", i);//sprintf可以将一个数值转换成一个字符串
    printf("%c\n", str[0]);
    printf("%s\n", str);
    
    double d = 1.234567890123;
    sprintf(str, "%.15lf", d);
    printf("%s\n", str);
    
    long l = 9876543210L;
    sprintf(str, "%ld", l);
    printf("%s\n", str);

    strcpy(str, "123");
    int a;
    sscanf(str, "%d", &a);//sscanf函数可以将一个数字字符串转换成数值
    printf("%d\n", a);
    
    strcpy(str, "26.889");
    float f;
    sscanf(str, "%f", &f);
    printf("%g\n", f);
    
    return 0;
}