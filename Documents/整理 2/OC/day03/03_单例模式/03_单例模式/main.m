//
//  main.m
//  03_单例模式
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRSingleton.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRSingleton *s1 = [TRSingleton sharedSingleton];
        NSLog(@"%p", s1);
        TRSingleton *s2 = [TRSingleton sharedSingleton];
        NSLog(@"%p", s2);
        
    }
    return 0;
}
