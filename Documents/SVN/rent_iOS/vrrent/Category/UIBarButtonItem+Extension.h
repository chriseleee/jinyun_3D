//
//  UIBarButtonItem+Extension.h
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString*)title;
@end
