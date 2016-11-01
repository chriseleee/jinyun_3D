//
//  08_宏函数.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define MIN(x, y) ((x) < (y) ? (x) : (y))
#define IS_ODD(x) ((x) % 2 != 0)
#define LOWER(ch) ((ch) >= 'A' && (ch) <= 'Z' ? (ch) - 'A' + 'a' : (ch))
#define PRINT(x) printf(#x"=%d\n", x) //#会使后面的宏参数变为字符串

int main()
{
    printf("MIN(3, 4)=%d\n", MIN(3, 4));
    
    int a;
    printf ("请输入一个数：");
    scanf("%d", &a);
    if (IS_ODD(a))
    {
        printf("%d是奇数\n", a);
    }
    
    
    char c = '0';
    printf("%c\n", LOWER(c));
    c = 'D';
    printf("%c\n", LOWER(c));
    
    a = 100;
    PRINT(a);
    int d = 200;
    PRINT(d);
    
    return 0;
}