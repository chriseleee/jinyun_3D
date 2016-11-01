//
//  main.m
//  03_NSString
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSString *str = [[NSString alloc]init];
//        
//        NSString *str1 = @"Hello";
//        NSString *str2 = @"Hello";
//        
//        int a;
//        scanf("%d", &a);
//        NSString *str3 = [NSString stringWithFormat:@"Hello %d", a];//按指定格式创建字符串
//        NSLog(@"%@", str3);
        
        
        NSString *str4 = @"www.tarena.com.cn";
        NSString *str5 = [str4 substringToIndex:3];//截取头
        NSLog(@"%@", str5);
        NSString *str6 = [str4 substringFromIndex:15];//截取尾
        NSLog(@"%@", str6);
        NSRange r = {4, 6};//str4中从第4个字符开始的连续6个字符
        NSString *str7 = [str4 substringWithRange:r];//截取中段
        NSLog(@"%@", str7);
        
        
        NSString *str8 = @"Hello";
        NSString *str9 = @" World";
        NSString *str10 = [[NSString alloc]initWithFormat:@"%@%@", str8, str9];//初始化拼接
        NSLog(@"%@", str10);
        NSString *str11 = [str8 stringByAppendingString:str9];//追加拼接
        NSLog(@"%@", str11);
        NSString *str12 = [str8  stringByAppendingFormat:@" 123 %@",str9];//格式化拼接
        NSLog(@"%@", str12);
        
        NSString *str13 = @"abcdefg";
        NSRange r1 = {2, 3};
        NSString *str14 = [str13 stringByReplacingCharactersInRange:r1 withString:@"123"];//字符串内容替换
        NSLog(@"%@", str14);
        
        
        NSString *str15 = [NSString stringWithContentsOfFile:@"/Users/tarena/Desktop/str" encoding:NSUTF8StringEncoding error:nil];//从文件中读取内容创建字符串
        NSLog(@"%@", str15);
        
        
        NSString *str16 = @"Hello";
        char str17[100];
        printf("请输入一个字符串：");
        scanf("%s", str17);
        NSString *str18 = [NSString stringWithCString:str17];//将C语言的字符串str17转换成OC字符串str18
        if ([str16 isEqualToString:str18] == YES)//判断两个字符串是否相同
        {
            NSLog(@"str16与str18相同");
        }
    }
    return 0;
}
