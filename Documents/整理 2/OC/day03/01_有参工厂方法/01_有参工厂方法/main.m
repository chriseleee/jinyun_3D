//
//  main.m
//  01_有参工厂方法
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p = [TRPoint pointWithX:10 andY:20];
        [p show];
    }
    return 0;
}
