//
//  main.m
//  06_可变数组
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //生成一个空数组，有意义，以后可以向其中添加元素
        NSMutableArray *array = [NSMutableArray array];
        //预估值，但预估值不是最大值，可以突破
        NSMutableArray *array1 = [NSMutableArray arrayWithCapacity:10];
        //将退化成一个常量数组NSArray
        NSMutableArray *array3 = @[@"one", @"two", @"three"];
        //标准方法
        NSMutableArray *array4 = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
        NSLog(@"%@", array4);
        for (int i = 0; i < array4.count; i++)
        {
            if ([array4[i] compare:@"tow"] == NSOrderedSame)
            {
                ;//相应的操作
            }
        }
        //向数组中最后一个元素后面添加一个元素
        [array4 addObject:@"four"];
        NSLog(@"%@", array4);
        //向数组的任意位置插入一个元素
        [array4 insertObject:@"five" atIndex:1];
        NSLog(@"%@", array4);
        //[array4 insertObject:@"five" atIndex:10];//注意越界的问题
        NSLog(@"%@", array4);
        //修改指定位置的一个元素
        [array4 replaceObjectAtIndex:1 withObject:@"aaaaa"];
        NSLog(@"%@", array4);
        //修改指定范围的多个元素
        NSMutableArray *replce = [NSMutableArray arrayWithObjects:@"five", @"six", @"seven", nil];
        NSRange r = {1, 2};
        [array4 replaceObjectsInRange:r withObjectsFromArray:replce];
        NSLog(@"%@", array4);
        //删除数组的最后一个元素
        [array4 removeLastObject];
        NSLog(@"%@", array4);
        //[array4 removeFirstObject];//没有直接删除数组第一个元素的方法
        //删除指定位置的元素
        [array4 removeObjectAtIndex:0];
        NSLog(@"%@", array4);
        //[array4 removeObjectAtIndex:10];//注意越界的问题
        NSLog(@"%@", array4);
        //可以直接删除对象
        [array4 removeObject:@"six"];
        NSLog(@"%@",array4);
        //删除指定范围的多个元素
        NSRange r1 = {1, 2};
        [array4 removeObjectsInRange:r1];
        NSLog(@"%@", array4);
        //清空数组
        [array4 removeAllObjects];
        NSLog(@"%lu", array4.count);
        //删除另一个数组中的元素
        NSMutableArray *array5 = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
        NSMutableArray *array6 = [NSMutableArray arrayWithObjects:@"one", @"two",  nil];
        [array5 removeObjectsInArray:array6];
        NSLog(@"%@", array5);
    }
    return 0;
}
