//
//  main.m
//  01_NSMutableSet
//
//  Created by tarena on 15/7/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableSet *set1 = [NSMutableSet setWithObjects:@"one", @"two", nil];
        NSMutableSet *set2 = [NSMutableSet setWithObjects:@"one", @"three", nil];
        
        //交集
        NSLog(@"%@", set1);
        [set1 intersectSet:set2];//intersectSet是NSSet的方法，运算结果被保存在set1中
        NSLog(@"%@", set1);
        
        //并集
        NSLog(@"%@", set1);
        [set1 unionSet:set2];
        NSLog(@"%@", set1);
        
        //从一个集合中删除另一个集合有的元素
        NSLog(@"%@", set1);
        [set1 minusSet:set2];
        NSLog(@"%@", set1);
    }
    return 0;
}
