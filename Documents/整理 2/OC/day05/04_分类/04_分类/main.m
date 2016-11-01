//
//  main.m
//  04_分类
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFraction.h"
#import "TRFraction+Initializer.h"
#import "TRFraction+Math.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRFraction *f1 = [TRFraction fractionWithNumerator:1 andDenominator:2];
        [f1 show];
        TRFraction *f2 = [TRFraction fractionWithNumerator:1 andDenominator:3];
        TRFraction *f3 = [f1 add:f2];
        [f3 show];
    }
    return 0;
}
