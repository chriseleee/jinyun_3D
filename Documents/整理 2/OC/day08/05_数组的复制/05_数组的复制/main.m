//
//  main.m
//  05_数组的复制
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *stu1 = [[TRStudent alloc] initWithID:1000 andName:@"zhangsan"];
        TRStudent *stu2 = [[TRStudent alloc] initWithID:1001 andName:@"lisi"];
        TRStudent *stu3 = [[TRStudent alloc] initWithID:1002 andName:@"wangwu"];
        NSArray *stu = @[stu1, stu2, stu3];
        NSArray *copiedStu = [[NSArray alloc] initWithArray:stu copyItems:NO];//当第二个参数是NO时，为引用计数拷贝
        
        //copiedStu[0]和stu[0]是同一个对象，该对象的引用计数为2
        NSLog(@"%d", [[stu objectAtIndex:0] ID]);
        [stu[0] setID:2000];
        NSLog(@"stu[0]:%d", [stu[0] ID]);
        NSLog(@"copiedStu[0]:%d", [copiedStu[0] ID]);
        
        NSLog(@"%p", stu);
        NSLog(@"%p", copiedStu);
        
        
        NSArray *copiedStu1 = [[NSArray alloc] initWithArray:stu copyItems:YES];
    }
    return 0;
}
