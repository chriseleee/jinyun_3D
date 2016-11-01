//
//  main.m
//  08_继承
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDog *dog = [[TRDog alloc]init];
        dog.name = @"旺财";
        dog.age = 8;
        [dog eat];
        [dog sleep];
    }
    return 0;
}
