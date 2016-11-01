//
//  05_结构体成员赋值.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

struct Person
{
    char name[100];
    bool gender;
    int age;
};

void print(int x)
{
    printf("%d\n", x);
}

void print1(struct Person x)//值传递
{
    printf("%s, %d, %d\n", x.name, x.gender, x.age);
}

void print2(struct Person* x)//地址传递
{
    printf("%s,%d,%d", x->name, x->gender, x->age);
    (*x).age++;//p.age++;
}

//编写一个函数，用于从终端输入结构体Person的变量值
void input(struct Person* x)
{
    printf("请输入一个名字：");
    scanf("%s", x->name);
    printf("请输入性别:");
    scanf("%d", &x->gender);
    printf("请输入年龄：");
    scanf("%d", &x->age);
}

int main()
{
    int a[5] = {1, 2, 3, 4, 5};//数组初始化
    a[0] = 10;//赋值时，数组元素只能逐个使用
    //a = {10, 20, 30, 40, 50};//赋值时，不能同时使用整个数组
    
    struct Person p1;
    input(&p1);
    struct Person p = {"wangwu", true, 55};//初始化
    //p.name = "zhangsan";
    strcpy(p.name, "zhangsan");
    p.gender = true;
    p.age = 30;//赋值时，只能逐个使用结构体的成员
    //p = {"lisi", false, 25};//赋值时，一次使用结构体的所有成员是错误的
    
    printf("%s,%d,%d\n", p.name, p.gender, p.age);
    print1(p);
    print2(&p);
    
    int a3 = 10;
    print(a3);
    
    return 0;
}