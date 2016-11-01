//
//  main.m
//  02_重构Student类
//
//  Created by tarena on 15/7/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc]init];
        stu.age = 20;
        stu.gender = YES;
        stu.salary = 1000;
        
        TRStudent *stu1 = [stu copy];
        [stu1 printInfo];
    }
    return 0;
}                      
