//
//  main.m
//  07_⾃动释放池
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p = [[TRPoint alloc] initWithX:10 andY:20];
        [p show];
        
        TRPoint *p1 = [TRPoint pointWithX:30 andY:40];
        [p1 show];
        NSLog(@"-------1-------");
    }
    NSLog(@"-------2-------");
    return 0;
}
