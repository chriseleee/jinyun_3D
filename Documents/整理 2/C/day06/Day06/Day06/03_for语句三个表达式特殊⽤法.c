//
//  03_for语句三个表达式特殊⽤法.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
//    int i = 0;
//    for (; i < 10; i++)//i是局部变量,表达式一可以省略
//    {
//        printf("%d ", i);
//    }
//    printf("\n");
//    printf("i = %d\n", i);
//    
//    //死循环
//    for(int j = 0; ; j++)//表达式二也可以省略，此时恒真
//    {
//        printf("%d ", j);
//    }
    
    for (int i = 0; i < 10; )//省略表达式三
    {
        printf("%d ", i++);
    }
    
    //for (;;)//三个表达式可以同时省略
    
    for (int i = 0, j = 1; i < 10; i++, j+=3)//表达式一和表达式三可以是逗号表达式
    {
        int t;
        (t = 3), 5;//逗号运算符的优先级最低
        t = (3, 5, 7, 9);//逗号运算符的值是最右边表达式的值，所以t被赋值为9
        printf("%d ", i * j + 5);
    }
    
    return 0;
}