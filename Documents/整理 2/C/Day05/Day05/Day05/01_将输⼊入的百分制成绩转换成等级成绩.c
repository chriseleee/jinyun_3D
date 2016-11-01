//
//  main.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int score;
    printf("请输入该学员的分数：");
    scanf("%d", &score);
    
    if (score < 0)
    {
        printf("请输入0~100之间的成绩\n");
        return 1;//错误退出，1是错误代码
    }
    if (score > 100)
    {
        printf("请输入0~100之间的成绩\n");
        return 2;//错误退出，2是错误代码
    }
    
    if (score >= 90)
    {
        printf("优\n");
    }
    else if (score < 60)
    {
        printf("不及格\n");
    }
    else
    {
        printf("一般\n");
    }
    
    return 0;//正常退出
}
