//
//  03_变量使⽤常⽤错误汇总.c
//  Day02
//
//  Created by tarena on 15/6/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    a = 0;//变量a没有声明
    int score = 0;
    scord = 100;//误将score输入成了scord
    
    int 123go = 100;//不能用数字开头
    int 成绩 = 98;//汉字不能作为变量名使用
    printf("姓名\n");//只能用于字符串
    printf("Hello World\n");
    
    int break = 200;//关键字不能做变量名使用
    
    int score1 = 59;
    printf("%d\n", Score1);//字母的大小写敏感
    printf（“%d\n",score1);//不要使用中文的括号或双引号
    
    int a1, b1 = 10;
    int sum;
    sum = a1 + b1;//a1没有初始化
    printf("%d\n", sum);
    
    
    
    
    
    
    return 0;
}