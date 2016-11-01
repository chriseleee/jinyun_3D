//
//  12_输出缓冲区.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

int main()
{
    for (int i = 0; i < 10; i++)
    {
        printf("%d\b", i);
//        fflush(stdout);//强制清空输出缓冲区
//        sleep(1);
    }

    sleep(10);//休眠10秒钟
    printf("\n");
 
    
    return 0;
}