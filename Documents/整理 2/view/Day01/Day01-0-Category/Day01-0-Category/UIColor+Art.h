//
//  UIColor+Art.h
//  Day01-0-Category
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Art)

//希望传0~255取值范围的三原色，返回对应的UIColor对象
+ (UIColor *)colorWith255R:(NSUInteger)red G:(NSUInteger)green B:(NSUInteger)blue;

@end








