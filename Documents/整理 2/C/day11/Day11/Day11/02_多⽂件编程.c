//
//  02_多⽂件编程.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>//stdio.h中也有防止多次包含的条件编译语句
#include "02_第一个人.h"
#include "02_第二个人.h"
#include "02_第三个人.h"

int main()
{
    int a[10];
    
    input(a, 10);
    int max = maxInArray(a, 10);
    output(a, 10, max);   
    
    return 0;
}
