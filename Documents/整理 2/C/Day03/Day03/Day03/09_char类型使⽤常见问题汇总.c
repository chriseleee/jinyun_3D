//
//  09_char类型使⽤常见问题汇总.c
//  Day03
//
//  Created by tarena on 15/7/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#include <stdio.h>

int main()
{
    char c = '你';//汉字不能作为字符使用
    
    c = 'a';
    printf("%d\n", c);
    
    c = 'abcdef';//单引号只能引起一个字符，不能引多个
    printf("%c\n", c);
    
    return 0;
}