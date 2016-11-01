//
//  AppDelegate.m
//  Day11-4-TabbarController
//
//  Created by tarena on 15/8/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.backgroundColor = [UIColor whiteColor];
//创建A,B,C,D 实例对象
    AViewController *aVC = [AViewController new];
    UINavigationController *aNavi = [[UINavigationController alloc] initWithRootViewController:aVC];
    BViewController *bVC = [BViewController new];
    UINavigationController *bNavi = [[UINavigationController alloc] initWithRootViewController:bVC];
    CViewController *cVC = [CViewController new];
    UINavigationController *cNavi = [[UINavigationController alloc] initWithRootViewController:cVC];
    DViewController *dVC = [DViewController new];
    UINavigationController *dNavi = [[UINavigationController alloc] initWithRootViewController:dVC];
    EViewController* eVC = [EViewController new];
//创建标签控制
    UITabBarController *tab = [UITabBarController new];
//把要显示的控制器放入到标签控制器中
    tab.viewControllers = @[aNavi, bNavi, cNavi, dNavi,eVC];
//让标签控制器成为window的根视图控制器
    _window.rootViewController = tab;
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
