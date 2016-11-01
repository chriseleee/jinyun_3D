//
//  07_登录合法判断程序.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    int password;
    
    do
    {
        printf("请输入密码：");
        scanf("%d", &password);
    }while (password != 123456);
    printf("登录成功\n");
    
    return 0;
}