//
//  main.m
//  01_Array
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //生成一个空数组，常量空数组没有实际意义
        NSArray *array = [NSArray array];
        //生成了一个只有一个元素的数组，意义也不大
        NSArray *array1 = [NSArray arrayWithObject:@"one"];
        NSLog(@"%@", array1);
        //生成有多个元素的数组，常用方法
        NSArray *array3 = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
        NSLog(@"%@", array3);
        //生成一个数组的副本
        NSArray *array4 = [NSArray arrayWithArray:array3];
        NSLog(@"%@", array4);
        //简化生成方法
        NSArray *array5 = @[@"one", @"two", @"three"];
        NSLog(@"%@", array5);
        //求数组元素个数的方法
        NSUInteger length = [array4 count];
        NSLog(@"%lu", (unsigned long)length);
        //获取数组中指定位置的元素值
        NSString *obj = [array4 objectAtIndex:0];
        NSLog(@"%@", obj);
        //简化后的方法
        NSLog(@"%@", array4[1]);
        //NSLog(@"%@", array4[5]);//注意越界问题
        //直接获取数组的最后一个元素值
        NSString *obj1 = [array4 lastObject];
        NSLog(@"%@", obj1);
        //直接获取数组的第一个元素值
        NSString *obj2 = [array4 firstObject];
        NSLog(@"%@", obj2);
        //在数组中查找指定元素，若有，返回该元素的下标，否则，返回垃圾值
        NSUInteger index = [array4 indexOfObject:@"two"];
        NSLog(@"%lu", index);
        index = [array4 indexOfObject:@"five"];
        NSLog(@"%lu", index);
        //遍历数组
        for (int i = 0; i < [array4 count]; i++)
        {
            NSLog(@"%@", array4[i]);
        }
    }
    return 0;
}
