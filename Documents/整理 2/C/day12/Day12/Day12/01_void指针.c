//
//  main.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int a = 10;
    int *p = &a;
    printf("%d\n", *p);
    
    float f = 3.14;
    p = &f;//不能将float型变量的地址赋值给int*类型的指针，不同类型的变量的地址都不能赋值给int*类型的指针
    
    double d = 6.28;
    p = &d;
    char ch = 'a';
    p = &ch;
    
    
    void *p1;//万能指针：该指针可以被赋值为任何类型变量的地址
    p1 = &a;
    p1 = &f;
    p1 = &d;
    p1 = &ch;
    p1 = "abcde";
    
    //printf("%d\n", *p1);//不能直接引用指针p1指向的地址的内容，因为p1无类型
    p1 = &a;
    printf("%d\n", *((int*)p1));//在使用万能指针引用指向对象时，必须现将其转换成相应类型，再引用
    p1 = &f;
    printf("%f\n", *(float*)p1);
    p1 = &d;
    printf("%lf\n", *(double*)p1);
    
    
    return 0;
}
