//
//  main.m
//  10_无参工厂方法练习
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDate *d = [TRDate date];
        [d show];
        TRDate *d1 = [TRDate date];
        [d1 show];
    }
    return 0;
}
