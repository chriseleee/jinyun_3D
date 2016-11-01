//
//  main.m
//  02_扩展
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFraction.h"
//#import "TRFraction_myExtension.h"//不要在主函数文件中包含扩展的.h文件

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRFraction *f = [[TRFraction alloc]init];
        f.numerator = 1;
        f.denominator = 3;
        //f.value = 10;//扩展中定义的属性为私有的，不能使用
        [f extensionMethod];//扩展中定义的方法也是私有的，不能使用
        //f->a = 20;//a是私有的
        f->b = 30;
        [f extensionMethod1];//extensionMethod也是私有的
    }
    return 0;
}
