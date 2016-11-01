//
//  main.c
//  Day06
//
//  Created by tarena on 15/7/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //计算m~n之间的和
    int m, n;
    printf("请输入开始的数：");
    scanf("%d", &m);
    printf("请输入结束的数：");
    scanf("%d", &n);
    
    int sum = 0;
    for (int i = m; i < n; i++)
    {
        sum += i;
    }
    printf("sum=%d\n", sum);
    
    return 0;
}
