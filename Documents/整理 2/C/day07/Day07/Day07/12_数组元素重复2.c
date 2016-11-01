
//
//  12_数组元素重复2.c
//  Day07
//
//  Created by tarena03 on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
int main()
{
    int x;
    printf("plase input a numble:");
    scanf("%d",&x);
    bool bs[10] = {0};
    
    do{
        int n = x%10;
        if (bs[n] == 1) {
            printf("重复了");
            break;
        }
        bs[n] = 1;
        x /= 10;
        
    }while (x) ;
    if (x == 0) {
        printf("没有重复");
    }
    
    
    return 0;
}