//
//  UIBarButtonItem+TRBarButtonItem.m
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIBarButtonItem+TRBarButtonItem.h"

@implementation UIBarButtonItem (TRBarButtonItem)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName withHighlightedImageName:(NSString *)hlImageName target:(id)target withAction:(SEL)action {
    //UIButton
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 80, 40);
    //image/hlImage
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //just for test
//    button.backgroundColor = [UIColor redColor];
    
    //返回创建好的UIBarButtonItem
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}








@end
