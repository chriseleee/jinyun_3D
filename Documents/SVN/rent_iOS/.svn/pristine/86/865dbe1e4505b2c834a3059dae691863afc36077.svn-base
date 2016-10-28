//
//  BaseTabBarViewController.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/27.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomePageViewController.h"
#import "MarketViewController.h"
#import "MyViewController.h"
#import "RenterBarViewController.h"
#import "BaseUINavigationController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
    
}

-(void)setupAllChildViewControllers{
    // 1.首页
    HomePageViewController *homePageVC = [[HomePageViewController alloc] init];
    [self setupChildViewController:homePageVC title:@"首页" imageName:@"tab_home" selectedImageName:@"tab_home_high"];
    
    // 2.租客吧
    RenterBarViewController *renterBarVC = [[RenterBarViewController alloc] init];
    [self setupChildViewController:renterBarVC title:@"租客吧" imageName:@"tab_forum" selectedImageName:@"tab_forum_high"];
    
    
    // 3.商城
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //    Cell的大小
    CGFloat cellW = (SCREEN_WIDTH-12*3)/2;
//    CGFloat cellH = (SCREEN_Height-12*3-60-44)/2;
    layout.itemSize = CGSizeMake(cellW, AdjustW(291));
    //    最小列间距
    layout.minimumInteritemSpacing = 12;
    //    最小行间距
    layout.minimumLineSpacing = 12;
    //    滚动方向为横向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    内容距离屏幕边缘的距离
    //参数顺序是top,left,bottom,right
    layout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);

    
    MarketViewController *marketVC = [[MarketViewController alloc]initWithCollectionViewLayout:layout];
    [self setupChildViewController:marketVC title:@"商城" imageName:@"tab_market" selectedImageName:@"tab_market_high"];
    
    // 4.我的
    MyViewController *myVC = [[MyViewController alloc] init];
    [self setupChildViewController:myVC title:@"我的" imageName:@"tab_user" selectedImageName:@"tab_user_high"];

}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
   
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 设置文字的样式
    UIColor *normalColor = UIColorFromRGBA(143,145,146,1);
    UIColor *selectedColor = UIColorFromRGBA(0,159,236,1);
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:normalColor} forState:UIControlStateNormal];
    
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : selectedColor} forState:UIControlStateSelected];
    
    // 2.包装一个导航控制器
    BaseUINavigationController *nav = [[BaseUINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
