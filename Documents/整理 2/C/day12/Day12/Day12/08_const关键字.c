//
//  08_const关键字.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void fun(const int x)
{
    //x = 10;
}

int main()
{
    const int x = 10;//const关键字能将一个变量变成只读的
    //x = 20;
    
    int i = 10;
    const int *p = &i;//当const在*的左边时，*p变成只读的
    int const *p2 = &i;//此种写法，等效于22行, *p2变成只读的
    //*p2 = 100;
    //*p = 20;
    i = 20;
    int j = 30;
    p = &j;
    //*p = 40;
    
    int *const p1 = &i;//当const在*的右边时，变量p本身变成只读的
    *p1 = 50;
    p1 = &j;
    
    return 0;
}