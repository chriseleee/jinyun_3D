//
//  03_数组名和数组⾸地址.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int a[5];
    printf("%p\n", &a[0]);//数组第一个元素的地址
    printf("%p\n", a);//数组名是一个地址，是数组第一个元素的地址
    a = 10;//数组名不能作为左值使用，即数组名是常量
    
    return 0;
}