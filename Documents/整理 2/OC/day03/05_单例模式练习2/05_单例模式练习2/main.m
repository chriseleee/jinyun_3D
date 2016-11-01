//
//  main.m
//  05_单例模式练习2
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p = [TRPoint sharedPoint];
        p.x = 10;
        p.y = 20;
        [p show];
    }
    return 0;
}
