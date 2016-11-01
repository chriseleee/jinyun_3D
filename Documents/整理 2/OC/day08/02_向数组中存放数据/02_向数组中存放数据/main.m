//
//  main.m
//  02_向数组中存放数据
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu = [[TRStudent alloc]init];
        stu.ID = 1000;
        stu.name = @"张三";
        NSLog(@"%@", stu);
        
        NSArray *array = @[[NSNumber numberWithInt:10], [NSNumber numberWithChar:'a'], [NSNumber numberWithFloat:10.1f], stu];
        for (int i = 0; i < [array count]; i++)
        {
            NSLog(@"%@", array[i]);
        }
    }
    return 0;
}
