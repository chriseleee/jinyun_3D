//
//  main.m
//  03_无参初始化
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"

struct MyStruct
{
    int i;
    double d;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i = [TRInteger alloc];
        i.integer = 10;//赋值
        [i show];
        
        int a = 10;//变量a的初始化
        struct MyStruct b = {10, 3.14};
        TRInteger *i1 = [[TRInteger alloc] init];
        //[i1 init];//初始化
        i1.integer = 30;
        i1.integer = 40;
        i1.integer = 50;
        [i1 show];
        
        int a1 = 10;
        a1 = 20;
        a1 = 30;
        a1 = 40;
    }
    return 0;
}
