//
//  UIView+Extension.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setMj_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)Mj_centerX
{
    return self.center.x;
}

- (void)setMj_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)Mj_centerY
{
    return self.center.y;
}

@end
