//
//  main.m
//  02_实例变量
//
//  Created by tarena on 15/7/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRExample.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRExample *e = [TRExample alloc];
        //e->i0 = 10;//保护的
        e->i1 = 10;//公有的
        NSLog(@"i1=%d", e->i1);
        //e->i2 = 10;//私有的
        e->i4 = 10;
        NSLog(@"i4=%d", e->i4);
        e->_i5 = 10;
    }
    return 0;
}
