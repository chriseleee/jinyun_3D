//
//  04_malloc函数.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a = 10;
    int *p = &a;
    *p = 20;
    printf("a=%d\n", *p);
    
    p = (int*)malloc(sizeof(int));//malloc能向操作系统申请一块儿存储空间
    *p = 20;
    printf("%d\n", *p);
    free(p);//free函数将指针变量p指向的空间还给操作系统，不还会造成内存泄漏
    
    float *pf;
    pf = (float*)malloc(sizeof(float));
    *pf = 3.14;
    printf("%f\n", *pf);
    free(pf);
    
    double *pd;
    pd = (double*)malloc(sizeof(double));//申请一个变量
    *pd = 6.27;
    printf("%lf\n", *pd);
    free(pd);
    
    pd = (double*)malloc(sizeof(double) * 10);//申请一个数组
    *pd = 15.87;
    printf("%g\n", *pd);
    *(pd + 1) = 23.987;
    printf("%g, %g\n", *pd, pd[1]);
    *(pd + 2) = 435.78;
    printf("%g, %g\n", *pd, pd[2]);
    for (int i = 0; i < 10; i++)
    {
        pd[i] = i * 10;
    }
    for (int i = 0; i < 10; i++)
    {
        printf("%g ", pd[i]);
    }
    printf("\n");
    free(pd);
    
    struct Example
    {
        int i;
        char ch;
        double d;
    };
    struct Example *pExample;
    pExample = (struct Example*)malloc(sizeof(struct Example));//申请一个结构体变量
    pExample->i = 10;
    pExample->ch = 's';
    pExample->d = 3.14;
    printf("%d, %c, %g\n", pExample->i, pExample->ch, pExample->d);
    free(pExample);
    
    char *str;
    str = (char*)malloc(sizeof(char) * 100);
    memset(str, 0, 100);
    
    return 0;
}