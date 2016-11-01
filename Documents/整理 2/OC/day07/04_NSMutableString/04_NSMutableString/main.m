//
//  main.m
//  04_NSMutableString
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建一个空字符串，以后可以向其中添加内容
        NSMutableString *str = [[NSMutableString alloc]init];
        //str1将退化成NSString，所以不要这样使用
        NSMutableString *str1 = @"Hello";
        //预估方法，预估值不是最大值，这种方法可以提高效率（常用）
        NSMutableString *str2 = [NSMutableString stringWithCapacity:58];
        //标准方法创建方法（常用）
        NSMutableString *str3 = [NSMutableString stringWithString:@"string"];
        NSMutableString *str4 = [NSMutableString stringWithFormat:@"age %d", 28];
        
        
        NSMutableString *str5 = [NSMutableString stringWithCapacity:100];
        //向空字符串str5中添加内容
        [str5 appendString:@"string"];
        NSLog(@"%@", str5);
        //格式化添加
        [str5 appendFormat:@" has %d characters", 6];
        NSLog(@"%@", str5);
        
        
        NSMutableString *str6 = [NSMutableString stringWithString:@"It is Objective-C language."];
        //获取要删除内容在字符串str6中的范围
        NSRange r = [str6 rangeOfString:@"Objective-"];//r = {6, 10}
        //在字符串str6中删除指定范围的内容
        [str6 deleteCharactersInRange:r];
        NSLog(@"%@",str6);
        
        
        NSMutableString *str7 = [NSMutableString stringWithString:@"This is a string"];
        NSRange r1 = [str7 rangeOfString:@"a"];
        //替换字符串str7中的a为another
        [str7 replaceCharactersInRange:r1 withString:@"another"];
        NSLog(@"%@", str7);
    }
    return 0;
}
