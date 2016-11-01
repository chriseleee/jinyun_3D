//
//  03_函数指针.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

void fa()
{
    printf("in function fa\n");
}

void fb()
{
    printf("in function fb\n");
}

void invoke(void (*f)())//回调
{
    printf("调用传过来的函数\n");
    (*f)();
}

int main()
{
    void (*pfa)();//定义了一个函数指针变量pfa
    pfa = fa;
    (*pfa)();//使用函数指针调用函数
    pfa = fb;
    (*pfa)();//多态
    
    invoke(fa);
    invoke(fb);
    
    return 0;
}