//
//  main.c
//  Day04
//
//  Created by tarena on 15/7/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    double a = 0.314;
//    a = .314;
//    printf("%lf\n", a);
//    printf("%g\n", a);//去掉小数后面的0
//    a = .315;
//    printf("%.2lf\n", a);//保留2位小数，第三位会四舍五入
//    
//    a = 3.14E-1;//3.14*10^-1
//    printf("%g\n", a);
//    a = 5.8E3;//5.8*10^3
//    printf("%g\n", a);
//    a = 1E2;
//    printf("%g\n", a);
//    
    a = 0.314f;
    printf("%f\n",a);

    a = 0.314788655689987L;
    printf("%lf\n",a);
    double money = 3.0;
    double price = 2.9;
    printf("%.17lf\n", money - price);//二进制无法精确表示1/10
    

    long int x = 1234567890L * 30;//加L表示是长整型常量
    printf("%ld\n", x);
    
    long long int y = 123LL;//加LL是长长整型
    
    unsigned int i1 = 123U;//加U是无符号整型
    
    unsigned long int i2 = 123LU;//LU是无符号长整型
    
    unsigned long long int i3 = 123LLU;//LLU是无符号长长整型
    
    return 0;
}
