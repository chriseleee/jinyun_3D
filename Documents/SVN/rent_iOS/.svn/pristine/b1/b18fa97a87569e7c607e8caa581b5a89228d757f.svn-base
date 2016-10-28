//
//  NSString+Extension.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "NSString+Extension.h"
#import "Const.h"

@implementation NSString (Extension)
- (NSString *)imageURL {
    
    if ([self hasPrefix:@"http://"] || [self hasPrefix:@"https://"]) {
        return self;
    }
    
    return [IMAGE_API stringByAppendingString:[self stringByReplacingOccurrencesOfString:@"//" withString:@"/"]];
}

///计算label的宽高
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, maxH);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT maxH:MAXFLOAT];
}

+ (CGSize)calculteStringSize:(NSString*)str fontSize:(CGFloat)fontsize{
    
    NSDictionary *attrDic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
    CGSize size = [str sizeWithAttributes:attrDic];
    return size;
}


@end
