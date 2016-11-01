//
//  main.m
//  04_数组排序练习
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1 = [[TRStudent alloc ]initWithID:1000 andName:@"zhangsan"];
        TRStudent *stu2 = [[TRStudent alloc ]initWithID:800 andName:@"lisi"];
        TRStudent *stu3 = [[TRStudent alloc ]initWithID:1500 andName:@"wangwu"];
        
        NSArray *stu = @[stu1, stu2, stu3];
        NSArray *sorted = [stu sortedArrayUsingSelector:@selector(compareID:)];
        for (int i = 0; i < sorted.count; i++)
        {
            NSLog(@"%@", sorted[i]);
        }
        NSArray *sortedName = [stu sortedArrayUsingSelector:@selector(compareName:)];
        for (int i = 0; i < sortedName.count; i++)
        {
            NSLog(@"%@", sortedName[i]);
        }
    }
    return 0;
}
