//
//  TRMessageView.m
//  Demo0_Homework
//
//  Created by tarena on 15-6-19.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "TRMessageView.h"

@implementation TRMessageView

- (void)drawRect:(CGRect)rect
{
    NSDictionary *textAttributes = @{
        NSForegroundColorAttributeName:[UIColor whiteColor],
        NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
    };

    CGRect textRect = [self.message boundingRectWithSize:CGSizeMake(200, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil];
    CGSize  popSize = CGSizeMake(textRect.size.width+20, textRect.size.height+20);
    CGRect popRect = CGRectMake(self.bounds.size.width-popSize.width-20, 10, popSize.width, popSize.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:popRect cornerRadius:10];
    [[UIColor lightGrayColor] setFill];
    [path fill];

    //绘制字符串内容
    [self.message drawInRect:CGRectMake(popRect.origin.x+10, 20, textRect.size.width, textRect.size.height) withAttributes:textAttributes];

}


@end
