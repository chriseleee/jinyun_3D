//
//  TRFraction+Initializer.m
//  04_分类
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFraction+Initializer.h"

@implementation TRFraction (Initializer)
-(id)initWithNumerator:(int)numerator andDenominator:(int)denominator
{
    if (self = [super init])
    {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    return self;
}
+(id)fractionWithNumerator:(int)numerator andDenominator:(int)denominator
{
    return [[TRFraction alloc] initWithNumerator:numerator andDenominator:denominator];
}
@end
