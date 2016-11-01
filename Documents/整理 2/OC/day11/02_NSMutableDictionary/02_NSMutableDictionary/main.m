//
//  main.m
//  02_NSMutableDictionary
//
//  Created by tarena on 15/7/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建一个空字典，有意义的，在后面可以向其中添加键值对
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
        //预估值
        NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithCapacity:18];
        //标准方法
        NSMutableDictionary *dict3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"string1", @"1", @"string2", @"2", nil];
        
        //添加一个键值对
        [dict3 setValue:@"string3" forKey:@"3"];
        NSLog(@"%@", dict3);
        //添加一个字典(多个键值对)
        NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
        [dict4 addEntriesFromDictionary:dict3];
        NSLog(@"%@", dict4);
        
        //字典覆盖
        NSMutableDictionary *dict5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"aaa", @"1", @"bbb", @"2",nil];
        NSLog(@"%@", dict4);
        [dict4 setDictionary:dict5];
        NSLog(@"dict5:%@", dict5);
        NSLog(@"dict4:%@", dict4);
        
        //删除一个键值对
        [dict4 removeObjectForKey:@"2"];
        NSLog(@"%@", dict4);
        //删除多个
        NSArray *delKeys = @[@"1", @"3"];
        [dict5 removeObjectsForKeys:delKeys];
        NSLog(@"%@", dict5);
        //清空字典
        [dict5 removeAllObjects];
        NSLog(@"%lu", dict5.count);
    }
    return 0;
}
