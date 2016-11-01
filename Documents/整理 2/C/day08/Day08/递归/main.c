//
//  main.c
//  递归
//
//  Created by tarena03 on 15/10/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int fun(int x){
    if (x > 5000) {
        return x;
    }
    printf("%d ",x);
    return fun(2*x);
}

int main(int argc, const char * argv[]) {
    // insert code here...
    fun(3);
    return 0;
}
