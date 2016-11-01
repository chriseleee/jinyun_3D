//
//  main.c
//  Day11
//
//  Created by tarena on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define DEBUG 0
#define IA64
#define IA32
#define LLVM3

int main(int argc, const char * argv[]) {
    //1 + 3 + 5 + 7 + ... + 99
    int sum = 0;
    for (int i = 1; i < 100; i += 2)
    {
        sum += i;
#if DEBUG //条件编译的作用是控制编译器是否编译某条语句到可执行文件中
        printf("sum=%d\n", sum);
#endif
    }
    printf ("sum=%d\n", sum);
    
#ifdef IA64
    printf("系统是64bits的\n");
#else
    printf("系统是32bits的\n");
#endif
    
#ifndef IA32
    printf("64bits\n");
#else
    printf("32bits\n");
#endif
    
#if defined LLVM4
    printf("LLVM4\n");
#elif defined LLVM3
    printf("LLVM3\n");
#elif defined LLVM2
    printf("LLVM2\n");
#endif
    
#undef IA32 //删除一个宏定义
#ifndef IA32
    printf("没有定义宏名IA32\n");
#endif
    
    return 0;
}
