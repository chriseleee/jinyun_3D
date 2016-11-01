//
//  main.m
//  02_有参工厂方法练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRDate *d = [TRDate dateWithYear:2015 andMonth:7 andDay:17];
        [d show];
    }
    return 0;
}
