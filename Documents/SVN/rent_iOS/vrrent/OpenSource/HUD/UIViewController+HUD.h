//
//  UIViewController+HUD.h
//  MobileReport
//
//  Created by ingplus on 13-9-29.
//  Copyright (c) 2013年 kobeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface UIViewController (HUD)
-(void)showHUDProgress:(NSString *)text;
-(void)removeHUDProgress;
-(void)showHUDText:(NSString *)text;
@end
