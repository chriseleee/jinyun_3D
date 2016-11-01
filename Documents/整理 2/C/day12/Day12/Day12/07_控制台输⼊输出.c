//
//  07_控制台输⼊输出.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a;
    printf("请输入一个数：");
    scanf("%d", &a);
    printf("a=%d\n", a);
    
    char ch;
    printf("请输入一个字符：");
    scanf("%*c");//清除键盘缓冲区
    scanf("%c", &ch);//当使用%c输入一个字符前，使用了其他格式控制符，输入了整数或小数，那么键盘缓冲区中，会留有一个回车符，被读入
    printf("ch=%c\n", ch);
    
    char str[5];
    printf("请输入一个字符串：");
    scanf("%4s", str);
    printf("%s\n", str);
    
    return 0;
}