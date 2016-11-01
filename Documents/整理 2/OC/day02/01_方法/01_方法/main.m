//
//  main.m
//  01_方法
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDate *date = [TRDate alloc];
        date.year = 2015;
        date.month = 7;
        date.day = 16;
        
        [date print];
        //[date days];//在主程序中，不能调用在.h文件中没有声明的类的方法
    }
    return 0;
}
