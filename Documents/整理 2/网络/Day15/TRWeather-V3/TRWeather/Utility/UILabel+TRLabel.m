//
//  UILabel+TRLabel.m
//  TRWeather
//
//  Created by tarena on 15/9/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UILabel+TRLabel.h"

@implementation UILabel (TRLabel)

+ (id)labelWithFrameByCategory:(CGRect)frame {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
    
    return label;
}








@end
