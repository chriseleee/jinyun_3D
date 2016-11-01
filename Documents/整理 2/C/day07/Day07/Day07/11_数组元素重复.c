//
//  11_数组元素重复.c
//  Day07
//
//  Created by tarena03 on 15/7/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
int main()
{
    int a[10] = {1,2,3,4,5,6,7,8,9,0};
    for (int i = 0; i<10; i++) {
        int j;
        for (j = i+1; j<10; j++) {
            if (a[i] == a[j]) {
                printf("%d,%d重复了",i,j);
                break;
            }
        }
        if (j < 10) {
            break;
        }
    }
    
    
    
    
    return 0 ;
}