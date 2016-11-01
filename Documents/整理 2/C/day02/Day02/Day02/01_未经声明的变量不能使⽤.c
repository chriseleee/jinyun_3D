//
//  01_未经声明的变量不能使⽤.c
//  Day02
//
//  Created by tarena on 15/6/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int a;
    a = 10;
    printf("%d\n", a);
    
    //b = 20;//使用未经声明的变量
    
    int number1, number2;//可以同时声明两个以上的变量
    float f1, f2;
    number1 = 100;
    number2 = number1;
    f1 = 3.1415;
    f2 = 9.8;
    printf("%d\n", number1);
    printf("%f\n", f1);
    
    //变量名的命名规则
    //int M.D.Thompson;
    int days;
    int date;
    int Denis;
    //int 3month;
    int _int;
    //int float;
    //int a>b;
    //int $888;
    
    int a = 98;
    int cLanguageScore = 98;
    int cYuYanChengJi = 100;
    
    
    
    
    
    return 0;
}