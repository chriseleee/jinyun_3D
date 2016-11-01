//
//  07_return与exit关键字.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int get(int x)
{
    return x;//return把返回值返回给调用处
}

void printInt(int x)//void表示没有返回值
{
    printf("x = %d\n", x);
    //return 0;
}

void show(int x)
{
    switch (x)
    {
        case 1:
            printf("x==1\n");
            return;
        case 2:
            printf("x==2\n");
            return;
        case 3:
            printf("x==3\n");
            return;
        case 4:
            exit(0);//直接返回OS X操作系统
    }
}

int main()
{
    int c;
    c = get(12345);
    printf("c=%d\n", c);
    
    printInt(12345);
    
    show(2);
    //show(4);//当实参为4时，程序直接结束，所以50行代码不会被执行
    printf("此句被执行了\n");
    
    return 0;//返回OS X操作系统
}