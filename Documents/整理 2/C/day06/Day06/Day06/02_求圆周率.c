//
//  02_求圆周率.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    //1-1/3+1/5-1/7+...
    double sum = 0;
    int flag = -1;
    for (int i = 1; i < 1000000000; i += 2)
    {
        flag *= -1;
        sum += flag * 1.0 / i;
    }
    printf("PI = %lf\n", sum * 4);
    
    return 0;
}