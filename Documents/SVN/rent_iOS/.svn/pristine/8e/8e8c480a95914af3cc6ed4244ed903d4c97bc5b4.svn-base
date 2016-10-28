//
//  CGTool.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/28.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "CGTool.h"
#import "UIWindow+HUD.h"
#import "AppDelegate.h"
@implementation CGTool

+(UILabel*)createLabelWithFrame:(CGRect)rect fontColor:(UIColor*)fontColor fontSize:(CGFloat)fontSize textAligment:(NSTextAlignment)textAligment
{
    UILabel *label=[[UILabel alloc] initWithFrame:rect];
    label.font=[UIFont systemFontOfSize:fontSize];
    label.textColor=fontColor;
    label.backgroundColor=[UIColor clearColor];
//    label.adjustsFontSizeToFitWidth=YES;
    label.textAlignment= textAligment;
    
    
    return label;
}

+(UITextField*)createTextFieldWithFrame:(CGRect)rect fontColor:(UIColor*)fontColor fontSize:(CGFloat)fontSize textAligment:(NSTextAlignment)textAligment
{
    UITextField *label=[[UITextField alloc] initWithFrame:rect];
    label.font=[UIFont systemFontOfSize:fontSize];
    label.textColor=[UIColor blackColor];
    [label setValue:fontColor forKeyPath:@"_placeholderLabel.textColor"];
    label.backgroundColor=[UIColor clearColor];
    //    label.adjustsFontSizeToFitWidth=YES;
    label.textAlignment= textAligment;

    return label;
}

//+(UILabel*)createLabelWithFrame:(CGRect)rect fontColor:(UIColor*)fontColor fontSize:(CGFloat)fontSize textAligment:(NSTextAlignment)textAligment
//{
//    UILabel *label=[[UILabel alloc] initWithFrame:rect];
//    label.font=[UIFont systemFontOfSize:fontSize];
//    label.textColor=fontColor;
//    label.backgroundColor=[UIColor clearColor];
//    //    label.adjustsFontSizeToFitWidth=YES;
//    label.textAlignment= textAligment;
//    
//    
//    return label;
//}


//返回按钮自定义
+ (void)createNavgationBackButtonWithTarget:(UIViewController *)ws action:(SEL)selector imageName:(NSString*)imageName{
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton addTarget:ws action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [backButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    ws.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

//创建nav rightbar button
+ (void)createNavgationRightBarButtonWithTarget:(UIViewController*)vc action:(SEL)selector imageName:(NSString*)imageName{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightButton addTarget:vc action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

///创建2个nav rightbar button
+ (void)createTwoNavgationRightBarButtonWithTarget:(UIViewController*)vc firstImageName:(NSString*)firstImageName secondImageName:(NSString*)secondImageName{
    
    UIButton *firstRightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [firstRightButton addTarget:vc action:@selector(firstClick) forControlEvents:UIControlEventTouchUpInside];
    
    [firstRightButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [firstRightButton setImage:[UIImage imageNamed:firstImageName] forState:UIControlStateNormal];
    
    UIButton *secondRightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [secondRightButton addTarget:vc action:@selector(firstClick) forControlEvents:UIControlEventTouchUpInside];
    
    [secondRightButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [secondRightButton setImage:[UIImage imageNamed:firstImageName] forState:UIControlStateNormal];
    
    vc.navigationItem.rightBarButtonItems = @[firstRightButton,secondRightButton];
    
}

+ (void)createTwoNavgationRightBarButtonWithTarget:(UIViewController*)vc firstImageName:(NSString*)firstImageName firstTitle:(NSString*)firstTitle secondImageName:(NSString*)secondImageName secondTitle:(NSString*)secondTitle{
    UIButton *firstRightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [firstRightButton addTarget:vc action:@selector(firstClick) forControlEvents:UIControlEventTouchUpInside];
    
    [firstRightButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [firstRightButton setImage:[UIImage imageNamed:firstImageName] forState:UIControlStateNormal];
    [firstRightButton setTitle:firstTitle forState:UIControlStateNormal];
    UIButton *secondRightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [secondRightButton addTarget:vc action:@selector(firstClick) forControlEvents:UIControlEventTouchUpInside];
    
    [secondRightButton setFrame:CGRectMake(0, 0, 32, 32)];
    
    [secondRightButton setImage:[UIImage imageNamed:firstImageName] forState:UIControlStateNormal];
    [secondRightButton setTitle:secondTitle forState:UIControlStateNormal];
    vc.navigationItem.rightBarButtonItems = @[firstRightButton,secondRightButton];

}

+(UIButton*)createBtnWithFontSize:(CGFloat)fontSize ImageName:(NSString*)imageName SelectedImage:(NSString *)selectedImage Title:(NSString*)titleName {
    UIButton *informationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationBtn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [informationBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [informationBtn setTitle:titleName forState:UIControlStateNormal];
    [informationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    informationBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return informationBtn;
}

#pragma mark  HUD
+ (void)showHUDTitle:(NSString *)title{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdel.window showHUDTitle:title];
}

+(void)showHUDText:(NSString *)HUDText
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([HUDText isEqual:[NSNull null]]) {
        return;
    }
    [appdel.window showHUDText:HUDText];
}

+(void)showHUDProgress:(NSString *)HUDText
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdel.window showHUDProgress:HUDText];
}

+(void)removeHUDProgress
{
    AppDelegate *appdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appdel.window removeHUDProgress];
}

+(BOOL)isLogin{
    //获取帐号信息字典
    NSMutableDictionary* loginDic = [CGFileManager readDocumentfile:kProfileDocument_login ];
    if ([loginDic[@"isLogin"] isEqualToString:@"YES"]) {
        return YES;
    }else{
        return NO;
    }
}

@end
