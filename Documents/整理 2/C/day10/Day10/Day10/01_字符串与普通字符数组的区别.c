//
//  main.c
//  Day10
//
//  Created by tarena on 15/7/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int a[5] = {10, 20, 30, 40, 50};
    
    char str3[6] = {'H', 'e', 'l', 'l', 'o', '\0'};//
    for (int i = 0; i < 5; i++)
    {
        printf("%c", str3[i]);
    }
    printf("\n");
    printf("%s\n", str3);//
    char str4[6] = "hello";//
    str4[0] = 'H';//
    printf("%s\n", str4);
    
    char str5[] = "中文字符串";//
    printf("%s\n", str5);
    
    char *str6 = "hello";//
    printf("%c\n", *str6);
    //*str6 = 'H';//崩溃
    printf("%s\n", str6);
    
    char str7[100];
    printf("请输入一个字符串：");
    scanf("%s", str7);//修改的是栈区
    printf("%s\n", str7);
    
    char *str8 = "12345";
    printf("请输入一个字符串：");
    scanf("%s", str8);//修改的是代码区，所以崩溃
    printf("%s\n", str8);
    
    return 0;
}
