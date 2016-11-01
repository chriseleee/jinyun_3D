//
//  11_日期和时间处理.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <time.h>

void printTime()
{
    clock_t t1, t2;
    t1 = clock();
    while (1)
    {
        t2 = clock();
        double diff = (double)(t2 - t1) / CLOCKS_PER_SEC;
        if (diff > 1)
        {
            time_t t;
            time(&t);
            printf("%s\n", ctime(&t));
            t1 = t2;
        }
    }
}

int main()
{
    printTime();
    
    clock_t t = clock();//得到从当前程序启动到本行clock函数被调用时为止所经过的时钟数（毫秒）
    printf("%lu\n", t);
    
    clock_t begin, finish;
    begin = clock();
    for (long i = 0; i < 1000000000L; i++)
    {
        ;//循环体内不作任何工作
    }
    finish = clock();
    double times = (double)(finish - begin) / CLOCKS_PER_SEC;
    printf("%g秒\n", times);
    
    
    time_t t1;
    time(&t1);//得到当前日历时间信息
    printf("%s\n", ctime(&t1));
    
    struct tm *gm = gmtime(&t1);
    printf("%s\n", asctime(gm));
    
    time_t begin1, finish1;
    time(&begin1);
    for (long i = 0; i < 1000000000L; i++)
    {
        ;
    }
    time(&finish1);
    printf("%f\n", difftime(begin1, finish1));//difftime函数得到两个时间的差（秒）
    
    
    char buffer[80];
    struct tm *lm = localtime(&t1);
    strftime(buffer, 80, "%Y年%m月%d日 %H:%M:%S", lm);
    printf("%s\n", buffer);
    
    //编制一个函数，每秒钟显示一次时间
    
    return 0;
}