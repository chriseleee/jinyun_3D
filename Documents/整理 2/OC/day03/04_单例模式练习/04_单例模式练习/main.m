//
//  main.m
//  04_单例模式练习
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        TRDate *d = [TRDate sharedDate];
        d.year = 2015;
        d.month = 7;
        d.day = 17;
        [d show];
        TRDate *d1 = [TRDate sharedDate];
        [d1 show];
    }
    return 0;
}
