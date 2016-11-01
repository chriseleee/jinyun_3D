//
//  02_变量的初始化.c
//  Day02
//
//  Created by tarena on 15/6/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int a;//未经初始化的变量中是随机值
    printf("%d\n", a);
    
    int b;
    b = a + 10;
    printf("%d\n", b);
    
    int c = 100;//在声明变量的同时给它一个值
    int d;
    d = 200;//在第一次使用之前，给它一个值
    float f = 6.666666;
    char ch = 'a';
    printf("%c\n", ch);
    double d1 = 6.888888888;
    
    ch = 'b';
    f = 5.5;
    d1 = 9.96;
    int num;
    num = 10;
    
    
    int i;
    i = 10;//赋值：将数据10放入变量i中
    int j;
    j = i;//访问：将变量i中的值取出来
    
    return 0;
}





