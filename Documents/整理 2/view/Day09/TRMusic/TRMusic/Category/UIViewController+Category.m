//
//  UIViewController+Category.m
//  TRMusic
//
//  Created by tarena on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)
- (void)changeTabbarItemWithName:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    //被选中的图片，默认情况下，会被系统的tintColor所渲染。
    //我们可以告诉图片，你的模式是不允许被渲染的,要保持原状
    //Original原状
    self.tabBarItem.image = [UIImage imageNamed:imageName];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    //让题目向上移动2像素
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    self.title = title;
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
}

@end






