//
//  main.m
//  04_ARC与MRC混编
//
//  Created by tarena on 15/7/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p = [[TRPoint alloc] init];
        p.x = 10;
        p.y = 20;
        TRPoint *p1 = p;
    }
    return 0;
}
