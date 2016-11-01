//
//  AppDelegate.m
//  Day01-4-NavigationBar
//
//  Created by tarena on 15/8/19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//美化导航栏
//设置背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
//设置有导航栏时，状态栏的文字颜色为白色
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
//设置左右按钮上的文字颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//设置中间的title的文字样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20],  NSForegroundColorAttributeName: [UIColor yellowColor]}];
//设置返回按钮中出现的箭头样式
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"tabbar_item_my_music"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"tabbar_item_my_music"]];
//设置导航条的背景图
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_back"] forBarMetrics:UIBarMetricsDefault];
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
