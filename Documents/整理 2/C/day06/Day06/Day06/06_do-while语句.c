//
//  06_do-while语句.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
//    int x = 0;
//    do
//    {
//        printf("%d ", x);
//        x++;
//    }while (x < 10);
//    printf("\n");
//    
//    x = 1;
//    do
//    {
//        printf("%d ", x);
//        x += 2;
//    }while(x < 10);
//    
//    x = 0;
//    do
//    {
//        printf("%d ", x);
//        x += 2;
//    }while(x < 10);
    
    /*------打印下表--------
     1       1
     2       4
     3       9
     4       16
     5       25
     ......
     ---------------*/
    int x = 1;
    do
    {
        printf("%d\t\t%d\n", x, x * x);
        x++;
    }while (x < 10);
    
    
    int fun;
    do
    {
        printf("1.打开文件\n");
        printf("2.保存文件\n");
        printf("3.退出\n");
        scanf("%d", &fun);
        switch (fun)
        {
            case 1:
                ;//打开文件
                break;
            case 2:
                ;//保存文件
                break;
            case 3:
                ;//退出
                break;
        }
    }while (fun != 3);
    
    return 0;
}