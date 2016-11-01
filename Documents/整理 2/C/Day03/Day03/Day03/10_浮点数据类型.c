//
//  10_浮点数据类型.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    float x;//单精度浮点型，精度是6位
    printf("%ld\n", sizeof(x));
    x = 3.14159;
    printf("%f\n", x);
    x = 1234567890 * 30.0;
    printf("%f\n", x);
    
    
    double d;//双精度浮点数，精度是15位
    printf("%ld\n", sizeof(d));
    d = 1234567890 * 30.0;
    printf("%lf\n", d);
    
    
    long double ld;
    printf("%ld\n", sizeof(ld));
    ld = 3.14;
    printf("%Lf\n", ld);
    
    
    return 0;
}