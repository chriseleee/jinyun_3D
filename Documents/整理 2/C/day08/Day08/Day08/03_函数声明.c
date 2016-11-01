//
//  03_函数声明.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int mediam(int x, int y, int z);//函数的声明

int main()
{
    printf("3,4,5这三个数中间的那个数是%d\n", mediam(3, 4, 5));//函数的调用
    return 0;
}

//写一个函数，在三个数中，找到中间的那个数
int mediam(int x, int y, int z)//函数的定义
{
    if (x < y)
    {
        if (y < z)//x<y&&y<z
        {
            return y;
        }
        else if (x < z)//x<y&&y>z&&x<z
        {
            return z;
        }
        else  //x<y&&y>z&&x>z
        {
            return x;
        }
    }
    else if (z < y) //x>y&&z<y
    {
        return y;
    }
    else if (x < z) //x>y&&z>y&&x<z
    {
        return x;
    }
    else //x>y&&z>y&&x>z
    {
        return z;
    }
}
