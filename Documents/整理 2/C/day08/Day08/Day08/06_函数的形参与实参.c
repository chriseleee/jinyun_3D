//
//  06_函数的形参与实参.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

//写一个函数，返回参数的平方值
int power(int x)//int x被称为形参
{
    //x = 12345;//形参可以被重新赋值
    return x * x;
}

int plus(int x)
{
    x++;
    printf("x = %d\n", x);
    return 0;
}

int fa()//无形参
{
    printf("in fa\n");
    return 0;
}

int fb(void)
{
    printf("in fb(void)\n");
    return 0;
}

int add(int x, int y)
{
    return x + y;
}

int main()
{
//    int y = power(3);//3被称为实参,当函数调用发生时，将实参赋值给形参
//    printf("%d\n", y);
//    y = power(5);
//    y = power(100);
    
    int x = 100;
    plus(x);//值传递
    printf("in main x = %d\n", x);
    
    fa(1, 2, 3, 4, 5);//实参的个数多于形参时，多出的实参被忽略
    
    //fb(1, 2);//函数定义时，加void，如果有实参，则报错
    fb();
    
    int r = add(10, 20);
    printf("r = %d\n", r);
    r = add(3.14, 2.68);//当实参的类型与形参的类型不一致时，以形参的类型为准进行转换
    printf("r=%d\n", r);
    
    return 0;
}