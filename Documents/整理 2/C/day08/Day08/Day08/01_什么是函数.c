//
//  main.c
//  Day08
//
//  Created by tarena on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int fa(int x)
{
    int y;
    y = x * x + 2 * x + 4;
    return y;
}

//y = x * x * x + 1
int fb(int x)
{
    int y;
    y = x * x * x + 1;
    return y;
}

//z = x * 3 + y / 4 + 5;
double fc(int x, int y)
{
    double z;
    z = x * 3 + y / 4.0 + 5;
    return z;
}

//f = x + y + z + 1;
int fd(int x, int y, int z)
{
    int f;
    f = x + y + z + 1;
    return f;
}

int fe()
{
    int x;
    scanf("%d", &x);
    int y = x * x + 2 * x + 4;
    printf("x=%d, y=%d\n", x, y);
    return y;
}

int menu()
{
    printf("1.宫保鸡丁\n");
    printf("2.水煮鱼\n");
    printf("3.油焖大虾\n");
    
    return 0;
}

int main(int argc, const char * argv[])
{
//    printf("x=%d, y=%d\n", 10, fa(10));
//    printf("x=%d, y=%d\n", 20, fa(20));
//    printf("x=%d, y=%d\n", 50, fa(50));
//    
//    printf("x=%d, y=%d\n", 10, fb(10));
//    printf("x=%d, y=%d\n", 20, fb(20));
//    printf("x=%d, y=%d\n", 50, fb(50));
//    
//    printf("x=%d, y=%d, z=%lf\n", 1, 2, fc(1, 2));
//    printf("x=%d, y=%d, z=%d, f=%d\n", 1, 2, 3, fd(1, 2, 3));
//    
//    for (int i = 0; i < 1000; i++)
//    {
//        printf("请输入一个数：");
//        fe();
//    }
    
    menu();
    
    return 0;
}