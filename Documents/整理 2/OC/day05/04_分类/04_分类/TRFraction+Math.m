//
//  TRFraction+Math.m
//  04_分类
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFraction+Math.h"

@implementation TRFraction (Math)
-(TRFraction *)add:(TRFraction *)f
{
    TRFraction *result = [[TRFraction alloc]init];
    result.numerator = self.numerator * f.denominator  + self.denominator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    return result;
}
@end
