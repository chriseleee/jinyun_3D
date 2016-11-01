//
//  main.m
//  05_copy
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i1 = [[TRInteger alloc]initWithInteger:10];
        [i1 show];
        TRInteger *i2 = [i1 copy];//使用copy方法实现深拷贝
        [i2 show];
    }
    return 0;
}
