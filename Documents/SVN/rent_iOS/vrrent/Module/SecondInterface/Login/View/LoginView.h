//
//  LoginView.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountDownButton;

@protocol LoginViewAlertShowDelegate <NSObject>
/**
 *  AlertShow的代理方法
 */
-(void)showAlertView:(UIAlertController*)alert;

@end


@protocol LoginViewBtnToLoginDelegate <NSObject>

/**
 *  登录跳转动作
 */
-(void)LoginViewToJump;

@end

@interface LoginView : UIView
/**
 *  AlertShow的代理
 */
@property(nonatomic) id<LoginViewAlertShowDelegate>alertDelegate;
/**
 *  登录跳转动作
 */
@property(nonatomic) id<LoginViewBtnToLoginDelegate>loginDelegate;
///手机号输入框
@property (strong,nonatomic)UITextField* phoneLabel;

///验证码输入框
@property (strong,nonatomic)UITextField* passWLabel;


///验证码获取按钮
@property (strong,nonatomic)JKCountDownButton* getPassBtn;

///登录按钮
@property (strong,nonatomic)UIButton* loginBtn;

@end
