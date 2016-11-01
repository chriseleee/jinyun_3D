//
//  06_位运算符.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int x;
    x = 5 & 3;
    printf("%d\n", x);
    x = 5 & 2;
    printf("%d\n", x);
    x = 6 & 3;
    printf("%d\n", x);
    
    x = 5 | 3;
    printf("%d\n", x);
    x = 4 | 1;
    printf("%d\n", x);
    
    
    x = ~5;//对正数求反时，-1-5
    printf("%d\n", x);
    x = ~-5;//对负数求反时，-1-（-5）
    printf("%d\n", x);


    
    return 0;
}