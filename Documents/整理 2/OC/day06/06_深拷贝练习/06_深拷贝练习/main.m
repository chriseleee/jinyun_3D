//
//  main.m
//  06_深拷贝练习
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
#import "TRBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc]init];
        stu.age = 18;
        TRBook *sanguo = [[TRBook alloc]init];
        sanguo.price = 10;
        stu.book = sanguo;//将书对象赋值给学生对象
        [stu study];
    }
    return 0;
}                      
