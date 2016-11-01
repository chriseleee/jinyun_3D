//
//  06_使⽤“++”和“--”运算符.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int x = 10;
    x++;//x = x + 1;
    printf("%d\n", x);//11
    ++x;//x = x + 1;
    printf("%d\n", x);//12
    x--;//x = x - 1;
    printf("%d\n", x);//11
    --x;//x = x - 1;
    printf("%d\n", x);//10
    
    x = 10;
    int y;
    y = x++;
//    y = x;
//    x = x + 1;
    printf("x=%d, y=%d\n", x, y);
    
    x = 10;
    y = ++x;
//    x = x + 1;
//    y = x;
    printf("x=%d, y=%d\n", x, y);
    
    x = 10;
    y = 20;
    y = ((x++)+y);
//    y = x + y;
//    x = x + 1;
    printf("x=%d, y=%d\n", x, y);
    
    return 0;
}