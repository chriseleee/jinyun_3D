//
//  SecondViewController.h
//  Day05-5-ValueBackDelegate
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class 强制声明一个类型，不管是否存在。
//如果不理解，请把下面的@class注释掉，看看哪里报错了！
@class SecondViewController;
//协议命名：类名+Delegate
//1
@protocol SecondViewControllerDelegate <NSObject>
-(void)viewController:(SecondViewController *)viewcontroller didFinishInputWithMessage:(NSString *)msg;
@end

@interface SecondViewController : UIViewController
//2
@property (nonatomic) id<SecondViewControllerDelegate> delegate;
@end





