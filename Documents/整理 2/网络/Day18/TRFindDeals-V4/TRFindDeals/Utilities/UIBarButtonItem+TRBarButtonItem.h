//
//  UIBarButtonItem+TRBarButtonItem.h
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TRBarButtonItem)


//返回一个创建好的UIBarButtonItem对象
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName withHighlightedImageName:(NSString *)hlImageName target:(id)target withAction:(SEL)action;












@end
