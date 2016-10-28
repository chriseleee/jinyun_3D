//
//  NSString+Extension.h
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
///url截取
- (NSString *)imageURL;

///自动计算size
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH;
- (CGSize)sizeWithFont:(UIFont *)font;
+ (CGSize)calculteStringSize:(NSString*)str fontSize:(CGFloat)fontsize;
@end
