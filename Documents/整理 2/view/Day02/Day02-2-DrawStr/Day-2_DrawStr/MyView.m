//
//  MyView.m
//  Day-2_DrawStr
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView
- (void)drawRect:(CGRect)rect{
    NSString *str = @"这是一段很长的聊天内容长度到底是多少还不知道需要聊天的人自己写着看反正就是很长再写点文字重新计算一个高度和宽度再看";
//设置字符串的显示属性
    NSDictionary *attrDic = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor redColor]};
//根据设定的最大宽度或者高度，来计算出字符串需要占用的空间大小
//Size 代表字符串被允许显示的范围
//options 每次都这么写，需要死记硬背
    CGRect strRect = [str boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading| NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil];
//在指定的区域内 画文字
    [str drawInRect:CGRectMake(10, 10, strRect.size.width, strRect.size.height) withAttributes:attrDic];
}
@end











