//
//  03_输⼊输出个⼈信息.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char name[100];
    int age;
    char school[100];
    
    printf("请输入姓名：");
    scanf("%s", name);
    printf("请输入年龄：");
    scanf("%d", &age);
    printf("请输入毕业院校：");
    scanf("%s", school);
    
    printf("学生个人信息如下：\n");
    printf("姓名：%s\n", name);
    printf("年龄：%d\n", age);
    printf("毕业院校：%s\n", school);
    
    return 0;
}