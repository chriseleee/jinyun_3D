//
//  main.m
//  03_NSMutableSet
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //生成了一个空的可变集合，它是有意义的，在后面可以向其中添加元素
        NSMutableSet *set1 = [NSMutableSet set];
        //预估值
        NSMutableSet *set2 = [NSMutableSet setWithCapacity:10];
        //标准方法
        NSMutableSet *set3 = [NSMutableSet setWithObjects:@"one", @"two", @"three", nil];
        
        //添加一个元素
        [set3 addObject:@"four"];
        NSLog(@"%@", set3);
        [set3 addObject:@"one"];//添加的方法也会剔除掉重复的元素
        NSLog(@"%@", set3);
        //添加多个元素
        NSArray *array = @[@"five", @"six", @"seven", @"two"];
        [set3 addObjectsFromArray:array];
        NSLog(@"%@", set3);
        
        //删除一个元素
        [set3 removeObject:@"one"];
        NSLog(@"%@", set3);
        //删除所有元素
        [set3 removeAllObjects];
        NSLog(@"%lu", set3.count);
    }
    return 0;
}
