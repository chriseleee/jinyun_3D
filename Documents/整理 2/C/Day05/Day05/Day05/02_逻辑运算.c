//
//  02_逻辑运算.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int a = 0;
    int b = 4;
    int c = 5;
    
    int r;
    r = (a && b);
    printf("r=%d\n", r);
    r = (a > b) && (b > c);
    printf("r=%d\n", r);
    r = (a < b) && (b < c);
    printf("r=%d\n", r);
    r = a < b && b > c;
    printf("r=%d\n", r);
    
    //判断一个数在3~8之间的方法
    a = -1;
    r = －2 < a < 0;
    printf("r=%d\n", r);
    r = (a > 3) && (a < 8);
    printf("r=%d\n", r);
    
    
    
    a = 3;
    b = 4;
    c = 5;
    r = a || b;
    printf("r=%d\n", r);
    r = (a > b) || (b > c);
    printf("r=%d\n", r);
    r = (a < b) || (b > c);
    printf("r=%d\n", r);
    r = ((a > b) && (b < c)) || (c > a);
    printf("r=%d\n", r);
    r = a < b || (b > c && c > a);
    printf("r=%d\n", r);
    
    //判断一个数不在3~8之间
    a = 5;
    r = a <= 3 || a > 8;
    
    
    
    a = 3;
    r = !a;
    printf("r=%d\n", r);
    b = 0;
    r = !b;
    printf("r=%d\n", r);
    r = !(a < b);
    printf("r=%d\n", r);
    r = (!a) > b;
    printf("r=%d\n", r);
    r = (!a) && b;
    printf("r=%d\n", r);
    r = !b + a;
    printf("r=%d\n", r);


    a = 3;
    b = 4;
    c = 5;
    r = (a > b) && (b > c++) && (c > a++);
    //r = a > b;
    printf ("a=%d, b=%d, c=%d\n", a, b, c);
    r = (a < b && b > c++) && c > a++;
    printf ("a=%d, b=%d, c=%d\n", a, b, c);
    
    r = a < b & b > c++ & c > a++;
    printf ("a=%d, b=%d, c=%d\n", a, b, c);

    return 0;
}