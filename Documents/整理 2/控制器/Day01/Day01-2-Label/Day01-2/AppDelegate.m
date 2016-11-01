//
//  AppDelegate.m
//  Day01-2
//
//  Created by tarena on 15/7/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//一个应用程序 必须要有一个窗口。所有的界面元素都需要放到窗口中显示。
//把窗口初始化
//    CGRect 是一个结构体，包含了origin和size两部分。
//    origin：CGPoint类型的结构体
//    size：CGSize类型的结构体
//    作用:记录视图在父视图中的位置以及占据的空间大小
//    origin代表定位，以父View的，所处的容器的左上角为原点。包含x，y。 x是离左边缘的距离。 y是离上边缘的距离。距离的单位是像素。
//    size代表大小，包含宽和高，width height，单位是像素
//    由于像素最小就是1像素。类型是double，但是小数点后面的是无效的，没有效果的
//    如何创建一个CGRect类型的变量
//    使用系统提供的一个函数即可，函数名字是有规律的，在结构体类型名后面加Make
//    如:
//    CGRect -> CGRectMake(x, y, width, height)
//    CGPoint -> CGPointMake(x, y)
//    CGSize ->  CGSizeMake(width, height)
    
//    window的位置和大小应该是多大？
//    位置 Origin 应该是 0, 0
//    大小 Size 应该是 屏幕宽  屏幕高
//    取屏幕的大小  Size
//    用新的类型 UIScreen， Screen 屏幕
//    我称这种完成代码的方式----填坑法
    
//如果是对象初始化方式
//    方法肯定是'-'开头
//    返回值肯定是id或者是instancetype类型
//    方法名肯定是 init开头的
//类初始化，通常是单例模式的。
//    方法肯定是'+'开头
//    返回值通常都是本身类型，偶尔也有instancetype，id
//    方法名 通常是shared，default，main，current,standard
//    非单例模式的初始化：[NSString stringWithFormat:*
    UIScreen *screen = [UIScreen mainScreen];
//    bounds中存的是CGReckMake(0, 0, 屏幕宽, 屏幕高)
    CGRect rect = screen.bounds;
    self.window = [[UIWindow alloc] initWithFrame:rect];
//    上方代码可以进行缩写⬇️
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//  给window一个背景颜色
    self.window.backgroundColor = [UIColor greenColor];
//    最后，让window显示出来
//    其实不写这个代码window也可以显示出来：window的显示由界面文件Main.storyboard来实现
    [self.window makeKeyAndVisible];
//    在屏幕上添加一个Label，标签
//    标签的位置是x 20， y 20， 宽度100，高度24
//    CGFloat 就是 double类型的 别名
    CGRect labelRect = CGRectMake(20, 20, 200, 24);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
//    标签内容为 Hello，World
    label.text = @"Hello, World";
//    需要把label添加到window上，它才可以显示出来//苹果不建议在window上添加控件，该例是授课需要
//    addSubView   添加子视图方法
    [_window addSubview:label];
//    修改文字的字体
    label.font = [UIFont systemFontOfSize:24];
//    给label一个背景色
    label.backgroundColor = [UIColor whiteColor];
//    设置文字颜色
    label.textColor = [UIColor redColor];
//    设置阴影颜色
    label.shadowColor = [UIColor purpleColor];
//    设置阴影的偏移量
    label.shadowOffset = CGSizeMake(5, 5);
//    内容对齐模式
    label.textAlignment = NSTextAlignmentRight;
//    文字超长处理
    label.text = @"我是超长我是超长我是超长我是超长";
/*
    NSLineBreakByWordWrapping 截取到最后一个单词
    NSLineBreakByCharWrapping 截取到最后一个字符
    NSLineBreakByClipping 直接截取
    NSLineBreakByTruncatingHead 在头部... ...xyz
    NSLineBreakByTruncatingTail 尾部... abc...
    NSLineBreakByTruncatingMiddle 在中部 ab..z
 */
    label.text = @"im so long,im so long,im so long";
    label.lineBreakMode = NSLineBreakByCharWrapping;
//  多属性字符串的使用 $700，$要红色的，700要黑色的
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] init];
//    NSFontAttributeName字典的key 代表字体
//    NSForegroundColorAttributeName 文字颜色
//    NSBackgroundColorAttributeName 文字背景色
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"$" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor redColor]}];
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"700" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:24], NSForegroundColorAttributeName: [UIColor blackColor]}];
    [attrString appendAttributedString:str1];
    [attrString appendAttributedString:str2];
    label.attributedText = attrString;
//  规定label的行数, 默认是1行，如果为0，代表无限行
//    label.frame.size.height = 300; 不允许直接设置CGRect类型中的任何属性，这些属性只读
    label.frame = CGRectMake(20, 20, 200, 400);
    label.text = @"规定Label的行数，默认是1行，如果为0，代表无限行，不允许直接设置类型中的任何属性。";
    label.numberOfLines = 0;
    
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
