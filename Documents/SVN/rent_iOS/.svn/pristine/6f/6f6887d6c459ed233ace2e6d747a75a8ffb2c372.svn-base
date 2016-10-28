//
//  CGTool.h
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface CGTool : NSObject
///创建label
+(UILabel*)createLabelWithFrame:(CGRect)rect fontColor:(UIColor*)fontColor fontSize:(CGFloat)fontSize textAligment:(NSTextAlignment)textAligment;
///创建TextField
+(UITextField*)createTextFieldWithFrame:(CGRect)rect fontColor:(UIColor*)fontColor fontSize:(CGFloat)fontSize textAligment:(NSTextAlignment)textAligment;

///返回按钮自定义
+ (void)createNavgationBackButtonWithTarget:(UIViewController *)ws action:(SEL)selector imageName:(NSString*)imageName;
///创建nav rightbar button
+ (void)createNavgationRightBarButtonWithTarget:(UIViewController*)vc action:(SEL)selector imageName:(NSString*)imageName;

///创建2个nav rightbar button
+ (void)createTwoNavgationRightBarButtonWithTarget:(UIViewController*)vc firstImageName:(NSString*)firstImageName secondImageName:(NSString*)secondImageName;
+ (void)createTwoNavgationRightBarButtonWithTarget:(UIViewController*)vc firstImageName:(NSString*)firstImageName firstTitle:(NSString*)firstTitle secondImageName:(NSString*)secondImageName secondTitle:(NSString*)secondTitle;
/**
 *  快速创建btn
 */
+(UIButton*)createBtnWithFontSize:(CGFloat)fontSize ImageName:(NSString*)imageName SelectedImage:(NSString *)selectedImage Title:(NSString*)titleName;

#pragma mark HUD提示框
+(void)showHUDText:(NSString *)HUDText;
+(void)showHUDProgress:(NSString *)HUDText;
+(void)showHUDTitle:(NSString *)title;
+(void)removeHUDProgress;
+ (NSString *)timeInfoWithDateString:(NSString *)dateString;


//全局判断是否登录
+(BOOL)isLogin;

@end
