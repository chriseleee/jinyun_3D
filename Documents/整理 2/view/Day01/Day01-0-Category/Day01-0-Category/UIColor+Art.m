//
//  UIColor+Art.m
//  Day01-0-Category
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIColor+Art.h"

@implementation UIColor (Art)
+ (UIColor *)colorWith255R:(NSUInteger)red G:(NSUInteger)green B:(NSUInteger)blue{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}
@end








