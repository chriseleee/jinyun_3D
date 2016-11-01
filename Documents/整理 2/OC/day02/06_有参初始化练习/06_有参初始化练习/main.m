//
//  main.m
//  06_有参初始化练习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p = [[TRPoint alloc] initWithX:10 andY:20];
        [p show];
        TRPoint *p1 = [[TRPoint alloc] initWithX:30 andY:50];
        [p1 show];
    }
    return 0;
}
