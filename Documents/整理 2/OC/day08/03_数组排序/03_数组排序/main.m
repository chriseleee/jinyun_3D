//
//  main.m
//  03_数组排序
//
//  Created by tarena on 15/7/24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i1 = [[TRInteger alloc]initWithInteger:10];
        TRInteger *i2 = [[TRInteger alloc]initWithInteger:3];
        TRInteger *i3 = [[TRInteger alloc]initWithInteger:8];
        TRInteger *i4 = [[TRInteger alloc]initWithInteger:17];
        TRInteger *i5 = [[TRInteger alloc]initWithInteger:5];
        
        NSArray *i = @[i1, i2, i3, i4, i5];
        //[i1 compareInt:i2]
        //SEL sel = @selector(compareInt:);
        NSArray *sorted = [i sortedArrayUsingSelector:@selector(compareInt:)];
        
        for (int i = 0; i < sorted.count; i++)
        {
            NSLog(@"%@", sorted[i]);
        }
    }
    return 0;
}
