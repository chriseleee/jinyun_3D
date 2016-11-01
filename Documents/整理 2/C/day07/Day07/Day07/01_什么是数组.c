//
//  main.c
//  Day07
//
//  Created by tarena on 15/7/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
//    //变量是存储数据的方法
//    int score = 100;
//    
//    int score1;
//    int score2;
//    int score3;
//    int score4;
//    int score5;
//    int score6;
//    
//    //数组就是多个变量集成在一起
//    int arrScore[100];//定义了一个数组，它相当于同时定义了100个变量
//    printf("%ld\n", sizeof(arrScore));//通过数组名求数组所占的存储空间大小
//    printf("%ld\n", sizeof(int [100]));//通过数组类型求数组所占的存储空间大小
//    
//    arrScore[0] = 10;
//    arrScore[1] = 20;
//    arrScore[9] = 100;
//    arrScore[49] = 500;
//    for (int i = 0; i < 100; i++)//循环100次，每次给一个变量赋值，共给100个变量赋值
//    {
//        arrScore[i] = i + 1;
//    }
//    for (int i = 0; i < 100; i++)
//    {
//        arrScore[i] = (i + 1) * 2;
//    }
//    for (int i = 0; i < 100; i++)
//    {
//        arrScore[i] = (i + 1) * 10;
//    }
//    for (int i = 0; i < 100; i++)
//    {
//        printf("请输入第%d个数：", i + 1);
//        scanf("%d", &arrScore[i]);
//    }
//    
//    float array1[10];
//    double array2[10];
//    char array3[5];
//    long array4[8];
    
    int i1 = 100;
    int a[5];//a[0]~a[4]
    int i2 = 200;
    for (int i = 0; i < 5; i++)
    {
        a[i] = (i + 1) * 10;
    }
    printf("i1=%d\n", i1);
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    printf("i2=%d\n", i2);
    a[5] = 60;//下届越界访问
    a[-1] = 70;//上届越界访问
    printf("i1=%d,i2=%d\n", i1, i2);
    
    
    10：40上课
    
    
    return 0;
}
