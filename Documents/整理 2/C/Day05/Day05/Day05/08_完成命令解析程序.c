//
//  08_完成命令解析程序.c
//  Day05
//
//  Created by tarena on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    //显示菜单
    printf("请选择功能：\n");
    printf("1.显示全部记录\n");
    printf("2.查询登录记录\n");
    printf("3.退出\n");
    
    int command;
    scanf("%d", &command);
    switch (command)
    {
        case 1:
            printf("显示全部记录\n");
        case 2:
            printf("查询登录记录\n");
            break;
        case 3:
            printf("退出\n");
            break;
        default:
            printf("输入的命令有误\n");
            break;
    }
}