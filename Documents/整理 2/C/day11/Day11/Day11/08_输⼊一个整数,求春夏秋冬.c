//
//  08_输⼊一个整数,求春夏秋冬.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

enum Season
{
    Spring,
    Summer,
    Autumn,
    Winter,
};

int main()
{
    int season;
    printf("请输入一个1~4之间的数：");
    scanf("%d", &season);
    
    switch (season)
    {
        case Spring:
            printf("春天\n");
            break;
        case Summer:
            printf("夏天\n");
            break;
        case Autumn:
            printf("秋天\n");
            break;
        case Winter:
            printf("冬天\n");
            break;
        default:
            printf("输入错误\n");
    }
}