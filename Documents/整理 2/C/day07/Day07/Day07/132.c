//
//  132.c
//  Day07
//
//  Created by tarena03 on 15/7/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int array[10]={1,2,3,4,5,6,7,8,9,0};
    srand((unsigned)time(0));
    for (int i = 0; i < 10; i++) {
        int k = rand()%(10-i)+i+1;
        int tem = array[i];
        array[i] = array[k];
        array[k]=tem;
        printf("%d   ",array[i]);
    }
    
    return 0 ;
}