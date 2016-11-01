//
//  main.c
//  Day09
//
//  Created by tarena on 15/7/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void fa(int x)//形参是局部变量
{
    x++;
    printf("in fa x=%d\n", x);
    
    int y = 20;//定义在函数体内的变量是局部变量
    y++;
    
    for (int i = 0; i < 10; i++)
    {
        printf("%d ", i);
    }
    //printf("%d\n", i);//变量i也是局部变量，它仅在循环体内起作用
    
    {//复合语句
        int b = 20;//变量b也是局部变量，它仅在所在的大括号内起作用
        printf("b=%d\n", b);
        int a[100] = {};
        a[0] = 123456;
    }
    //printf("b=%d\n", b);
    //printf("a[0]=%d\n", a[0]);
}

int main(int argc, const char * argv[]) {

    int x = 100;
    fa(x);
    printf("in main x=%d\n", x);
    //printf("%d\n", y);
    
    return 0;
}
