//
//  06_重新分配申请的空间.c
//  Day12
//
//  Created by tarena on 15/7/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int *p;
    p = (int *)malloc(3 * sizeof(int));
    for (int i = 0; i < 3; i++)
    {
        p[i] = i + 1;
        printf("%d ", p[i]);
    }
    printf("\n");
    
    p = (int*)realloc(p, 5 * sizeof(int));
    for (int i = 0; i < 5; i++)
    {
        p[i] = i + 1;
        printf("%d ", p[i]);
    }
    printf("\n");
    
    free(p);
    
    printf("%d\n", *p);
    
    return 0;
}