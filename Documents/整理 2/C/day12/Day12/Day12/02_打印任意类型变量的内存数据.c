//
//  02_打印任意类型变量的内存数据.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

enum Type
{
    INT, FLOAT, DOUBLE, CHAR, LONG,
};

void print(void* data, enum Type type)
{
    switch (type)
    {
        case INT:
            printf("%d\n", *(int*)data);
            break;
        case FLOAT:
            printf("%f\n", *(float*)data);
            break;
        case DOUBLE:
            printf("%lf\n", *(double*)data);
            break;
        case CHAR:
            printf("%c\n", *(char*)data);
            break;
        case LONG:
            printf("%ld\n", *(long*)data);
            break;
    }
}

int main()
{
    int a = 10;
    print(&a, INT);
    
    float f = 3.14;
    print(&f, FLOAT);
    
    double d = 6.28;
    print(&d, DOUBLE);
    
    char ch = 'g';
    print(&ch, CHAR);
    
    return 0;
}