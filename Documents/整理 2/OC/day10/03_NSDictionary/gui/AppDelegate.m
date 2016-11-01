//
//  AppDelegate.m
//  gui
//
//  Created by tarena03 on 15/8/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
/*
    由数组创建
    NSDictionary* dict1 = [NSDictionary dictionaryWithObjectsAndKeys:stu1,@"1",stu2,@"2",nil];
    NSArray *objects=@[stu1,stu2];
    NSArray *objects=@[@"1",@"2"];
    NSDictionary* dict2=[NSDictionary dictionaryWithObjects:objects forKeys:keys];
//    获取字典中所有的关键字
    NSArray *keys1=[dict3 allKeys];
    NSArray* keys2 = [dict4 allKeysForObject:stu1];
    TRStudent* stu3=[dict4 objectForKey:@"1"]
    获取字典中所有的值
    NSArray* values=[dict4 allValues];
    对字典进行排序后，得到关键字的顺序
    NSArray* sortedk=[dict5 keysSortedByValueUsingSelcetor:@selector(compareName:)];
    for(NSString *key in sortedk)
 {
    NSLog(@"%@:%@",key,dict5[key]);
 }
    通过枚举器遍历字典中所有的值对象
    [dict5 objectEnumerator];
    dict5 keyEnumerator];
 
 
 
 */
    
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
