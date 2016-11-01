//
//  BackGroudView.m
//  Day6-5-DynamicAttachment
//
//  Created by tarena on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BackGroudView.h"

@implementation BackGroudView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor greenColor] setStroke];
    [[UIColor redColor] setFill];
    [self.path fill];
    [self.path stroke];
}


@end
