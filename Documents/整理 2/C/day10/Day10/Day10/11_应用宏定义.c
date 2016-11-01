//
//  11_应用宏定义.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

#define 主函数 int main()
#define 开始 {
#define 结束 }
#define 打印字符串 printf("Hello world\n");
#define 循环(x) for (int i = 0; i < x; i++)
#define 打印整数(x) printf("%d ", x);


主函数
开始
    打印字符串
    循环(20)
    开始
        打印整数(i)
    结束
结束