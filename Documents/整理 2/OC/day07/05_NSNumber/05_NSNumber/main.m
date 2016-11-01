//
//  main.m
//  05_NSNumber
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = -10;
        //将基本数据类型变量a，封装成OC的类NSNumber类型
        NSNumber *i = [NSNumber numberWithInt:a];
        NSLog(@"%@", i);
        //拆封
        int b = [i intValue];
        NSLog(@"%d", b);
        //封装无符号整型数
        NSNumber *i1 = [NSNumber numberWithUnsignedInt:10];
        NSLog(@"%@", i1);
        //拆封
        unsigned int c = [i1 unsignedIntValue];
        NSLog(@"%u", c);
        //封装一个字符
        NSNumber *i2 = [NSNumber numberWithChar:'a'];
        NSLog(@"%@", i2);
        //拆封
        char d = [i2 charValue];
        NSLog(@"%c", d);
        //封装一个float型变量
        NSNumber *i3 = [NSNumber numberWithFloat:3.14];
        //拆封
        float e = [i3 floatValue];
        //封装一个double型变量
        NSNumber *i4 = [NSNumber numberWithDouble:3.1415926];
        //拆封
        double f = [i4 doubleValue];
        //封装一个BOOL型变量
        NSNumber *i5 = [NSNumber numberWithBool:YES];
        //拆封
        BOOL g = [i5 boolValue];
    }
    return 0;
}
