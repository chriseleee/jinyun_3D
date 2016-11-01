//
//  main.m
//  02_NSSet
//
//  Created by tarena on 15/7/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建
        NSSet *set1 = [NSSet setWithObjects:@"one", @"two", @"three", nil];
        NSLog(@"%@", set1);
        NSSet *set2 = [NSSet setWithObjects:@"one", @"one", @"two", nil];//集合中不能有重复的元素
        NSLog(@"%@", set2);
        //复制
        NSSet *set3 = [NSSet setWithSet:set2];
        NSLog(@"%@", set3);
        //由数组创建集合
        NSArray *array = @[@"one", @"two", @"two", @"three"];
        NSSet *set4 = [NSSet setWithArray:array];
        NSLog(@"%@", set4);
        
        TRStudent *stu = [TRStudent studentWithName:@"zhangsan" andAge:21];
        TRStudent *stu1 = [TRStudent studentWithName:@"lisi" andAge:21];
        TRStudent *stu2 = [TRStudent studentWithName:@"zhangsan" andAge:21];
        //BOOL a = [stu isEqual:stu];
        NSSet *set5 = [NSSet setWithObjects:stu, stu1, stu2, nil];//setWithObjects会自动调用TRStudent类中的hash和isEqual方法，排除掉重复元素
        NSLog(@"%@", set5);
        
        //判断集合中是否拥有某个元素
        if ([set5 containsObject:stu] == YES)
        {
            NSLog(@"集合set5中包含stu");
        }
        
        //判断两个集合是否相等
        NSSet *set6 = [NSSet setWithObjects:@"One", @"two", nil];
        NSSet *set7 = [NSSet setWithObjects:@"One", @"two", nil];
        if ([set6 isEqualTo:set7] == YES)
        {
            NSLog(@"set6与set7相等");
        }
        
        //判断一个集合是否为另一个集合的子集
        NSSet *set8 = [NSSet setWithObjects:@"one", @"two", @"three", nil];
        NSSet *set9 = [NSSet setWithObjects:@"one", @"two", nil];
        if ([set9 isSubsetOfSet:set8] == YES)
        {
            NSLog(@"set9是set8得子集");
        }
        
        //将一个集合转换成数组
        NSArray *array1 = [set8 allObjects];
        NSLog(@"%@", array1);
        
        //使用枚举器遍历集合
        NSEnumerator *e = [set8 objectEnumerator];//获取set8集合的枚举器
        NSString *s;
        while(s = [e nextObject])//nextObject获取set8中的每一个元素
        {
            NSLog(@"%@", s);
        }
    }
    return 0;
}
