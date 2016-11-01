//
//  AppDelegate.m
//  Day01-5-Tabbar
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//设置整个tabbar的背景图
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_back"]];
//设置tabbar上每一个项被选中时的背景图
    [[UITabBar appearance]setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected_back"]];
//设置tabbaritem上 题目的位置
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -4)];
//设置tabbaritem上的题目的文字大小 和 颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14], NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
//设置被选中状态颜色和大小
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14], NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
