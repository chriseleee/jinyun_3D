//
//  07_关系运算.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

int main()
{
    printf("%d\n", 5 > 3);
    printf("%d\n", 5 < 3);
    printf("%d\n", 5.8 > 3.1);
    printf("%d\n", 5 > 3.9);
    
    int r = 5 > 3;
    printf("r = %d\n", r);
    int a = 3;
    int b = 4;
    r = a > b;
    printf("r = %d\n", r);
    r = a == b;
    r = a != b;


    //逻辑值
    int r1;
    r1 = 1;//真
    r1 = 5;//真
    r1 = -15;//真
    r1 = 0;//假
    
    bool r2;
    printf("%ld\n", sizeof(r2));
    r2 = 1;
    r2 = a > b;
    printf("%d\n", r2);
    r2 = true;
    r2 = false;
    
    return 0;
}