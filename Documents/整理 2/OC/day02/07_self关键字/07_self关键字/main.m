//
//  main.m
//  07_self关键字
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
        [p setX:50 andY:80];
        [p show];
        NSLog(@"%d,%d", p.x, p.y);
    }
    return 0;
}
                      