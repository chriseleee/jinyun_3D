//
//  main.m
//  05_有参初始化
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i = [[TRInteger alloc] initWithInteger:10];
        [i show];
        TRInteger *i1 = [[TRInteger alloc]initWithInteger:30];
        [i1 show];
    }
    return 0;
}
