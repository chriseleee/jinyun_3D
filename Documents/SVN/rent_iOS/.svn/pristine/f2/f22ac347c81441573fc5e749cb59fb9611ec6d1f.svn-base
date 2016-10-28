//
//  UIViewController+HUD.m
//  MobileReport
//
//  Created by ingplus on 13-9-29.
//  Copyright (c) 2013年 kobeli. All rights reserved.
//

#import "UIViewController+HUD.h"

@implementation UIViewController (HUD)
-(void)showHUDProgress:(NSString *)text
{
    MBProgressHUD *HUD;
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    
    //设置对话框文字
    HUD.labelText = text;
    
    //显示对话框
    [HUD show:YES];  
}

-(void)removeHUDProgress
{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MBProgressHUD class]]) {
            [view removeFromSuperview];
        }
    }
}

-(void)showHUDText:(NSString *)text
{
    MBProgressHUD *HUD;
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = text;
    HUD.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    //    HUD.yOffset = 150.0f;
    //    HUD.xOffset = 100.0f;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1.5);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}
@end
