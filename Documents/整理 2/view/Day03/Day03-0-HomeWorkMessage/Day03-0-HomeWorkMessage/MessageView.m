//
//  MessageView.m
//  Day03-0-HomeWorkMessage
//
//  Created by tarena on 15/8/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView
- (void)drawRect:(CGRect)rect{
//有一个字典 存储字符串的属性，如字体大小，颜色
    NSDictionary *textAttr = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor orangeColor]};
//计算字符串高度
    CGRect textRect = [_message boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil];
//在字符串显示范围外部 画一个背景，圆角矩形
//x轴，泡泡需要在屏幕右侧，距离恒定为20
//屏幕宽度-泡泡的宽度-屏幕距离
    CGSize paopaoSize = CGSizeMake(textRect.size.width + 20, textRect.size.height + 20);
    CGRect paopaoRect = CGRectMake(self.bounds.size.width - paopaoSize.width - 20, 10, paopaoSize.width, paopaoSize.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:paopaoRect cornerRadius:10];
    [[UIColor greenColor] setFill];
    [path fill];
//在圆角矩形内部，画字符串
    [_message drawInRect:CGRectMake(paopaoRect.origin.x + 10, 20, textRect.size.width, textRect.size.height) withAttributes:textAttr];
}
@end







